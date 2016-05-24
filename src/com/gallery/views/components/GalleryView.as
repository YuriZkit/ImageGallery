/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package com.gallery.views.components {
import assets.scrollBtn;

import base.BaseView;
import base.ui.DragButtonView;

import com.gallery.models.ImageVO;
import com.gallery.views.components.renderers.ImageView;
import com.greensock.BlitMask;
import com.greensock.TweenMax;
import com.greensock.easing.Back;

import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.geom.Rectangle;

public class GalleryView extends BaseView {
    private static const SCROLL_TWEEN_DURATION:Number = 1;
    private static const IMAGE_SIZE:Array = [50, 150, 200, 250, 350];
    private static const GAP:uint = 3;

    public function GalleryView() {
        super();
        _displayedImages = new Array();
    }
    private var _displayedImages:Array;
    private var _viewRect:Rectangle;
    private var _scrollMC:MovieClip;
    private var _scrollBtn:DragButtonView;
    private var _imgContainer:Sprite;
    private var _tweenScroll:TweenMax;
    private var _totalScrollAmount:Number;
    private var _blitMask:BlitMask;

    private var _imageIdealHeight:uint = 0;

    public function set imageIdealHeight(value:uint):void {
        trace("imageIdealHeight", _imageIdealHeight = IMAGE_SIZE[value]);
    }

    override public function createChildren():void {
        super.createChildren();
        _scrollMC = new scrollBtn();
        _scrollBtn = new DragButtonView(_scrollMC);
        _scrollMC.visible = false;
        _scrollBtn.enabled = false;
        _scrollBtn.positionChangeSignal.add(updateContainerPosition);
        _imgContainer = new Sprite();
        _tweenScroll = TweenMax.to(_imgContainer, SCROLL_TWEEN_DURATION, {y: 0, ease: Back.easeOut.config(0.8)});
        addChild(_imgContainer);
        addChild(_scrollMC);
    }

    override public function resize(width:Number, height:Number):void {
        _viewRect = new Rectangle(0, 0, width, height);
        _scrollMC.x = _viewRect.width;
        _scrollMC.y = _scrollMC.height / 2;
        _scrollBtn.dragRect = new Rectangle(_scrollMC.x, _scrollMC.y, 0, _viewRect.height - _scrollMC.height);
        _imgContainer.y = 0;
    }

    override public function destroy():void {
        super.destroy();
    }

    public function updateImages(imagesList:Vector.<ImageVO>):void {
        for (var elementID:int = 0; elementID < imagesList.length; elementID++) {
            if (!_displayedImages[elementID]) {
                var imageRenderer:ImageView = new ImageView(imagesList[elementID], _imageIdealHeight);
                _displayedImages[elementID] = imageRenderer;
                _imgContainer.addChild(imageRenderer);
            }
        }
    }

    public function updatePositions():void {
        var row:Array = new Array();
        var currentWidth:Number = 0;
        var rowY:int = 0;
        var image:ImageView;
        for (var imgID:int = 0; imgID < _displayedImages.length; imgID++) {
            image = _displayedImages[imgID];
            image.imageHeight = _imageIdealHeight;
            if (currentWidth + image.width > _viewRect.width) {
                rowY += positionRow(row, currentWidth, rowY) + GAP;
                row = new Array();
                currentWidth = 0;
            }
            row.push(image);
            currentWidth += image.width;
        }
        if (row.length) {
            positionRow(row, currentWidth, rowY);
        }
        updateBlitMask();
        updateScrollBar();
    }

    private function updateContainerPosition(dragPosition:Point):void {
        _blitMask.enableBitmapMode();
        _tweenScroll.updateTo({
            y: -(_totalScrollAmount) * dragPosition.y,
            onComplete: _blitMask.disableBitmapMode
        }, true);
    }

    private function updateBlitMask():void {
        if (_blitMask)
            _blitMask.dispose();
        _blitMask = new BlitMask(_imgContainer, 0, 0, _viewRect.width, _viewRect.height, true, true);
    }

    private function updateScrollBar():void {
        _totalScrollAmount = _imgContainer.height - _viewRect.height;
        _scrollBtn.enabled = _scrollMC.visible = _imgContainer.height > _viewRect.height;
        if (!_scrollBtn.enabled) {
            removeEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheel);
        } else if (!hasEventListener(MouseEvent.MOUSE_WHEEL)) {
            addEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheel);
        }
        _scrollBtn.updatePosition(0, -_imgContainer.y
                / _totalScrollAmount);
    }

    private function positionRow(row:Array, currentWidth:Number, rowY:Number):Number {
        var emptySpace:Number = _viewRect.width - currentWidth - GAP * row.length; //space without images
        var elementX:Number = GAP; //the first element will appear with some gap
        for (var col:uint = 0; col < row.length; col++) {
            var element:ImageView = row[col];
            var increaseImageSpace:Number = (element.width / currentWidth) * emptySpace; //find how much empty space to take
            var scaleIdealHeight:Number = (increaseImageSpace + element.width) / element.width; //find how much to scale idealHeight
            element.imageHeight *= scaleIdealHeight;
            element.y = rowY;
            element.x = elementX;
            elementX += element.width + GAP;
        }
        return element.height;
    }

    private function onMouseWheel(event:MouseEvent):void {
        var dir:int = event.delta / Math.abs(event.delta);
        _scrollBtn.updatePosition(0, (-_imgContainer.y - dir * _imageIdealHeight) / _totalScrollAmount);
    }
}
}
