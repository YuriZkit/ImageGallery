/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer.views.components {
import assets.scrollBtn;

import base.BaseView;
import base.ui.DragButtonView;

import com.greensock.TweenLite;
import com.greensock.TweenMax;

import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.Sprite;
import flash.geom.Point;

import flash.geom.Rectangle;

import viewer.views.components.renderers.ImageView;

public class GalleryView extends BaseView {

    private var _displayedImages:Array;
    private var _viewRect:Rectangle;
    private var _imageHeight:uint = 200;
    private var _scrollMC:MovieClip;
    private var _scrollBtn:DragButtonView;
    private var _imgContainer:Sprite;
    private var _tweenScroll:TweenMax;
    private var _scrollTweenDuration:Number = 1;
    private static const GAP:uint = 3;
    private var _mask:Shape;
    public function GalleryView() {
        super();
        _displayedImages = new Array();
    }

    override public function createChildren():void {
        super.createChildren();
        _scrollMC = new assets.scrollBtn();
        _scrollBtn = new DragButtonView(_scrollMC);
        _scrollMC.visible = false;
        _scrollBtn.enable = false;
        _scrollBtn.positionChangeSignal.add(updateContainerPosition);
        _imgContainer = new Sprite();
        _tweenScroll = TweenMax.to(_imgContainer, _scrollTweenDuration,{y:0});
        _tweenScroll.delay(0.1);
        _mask = new Shape();
        _mask.graphics.beginFill(0x000000);
        mask = _mask;
        addChild(_imgContainer);
        addChild(_scrollMC);
    }

    private function updateContainerPosition(dragPosition:Point):void {
        _tweenScroll.updateTo({y:-(_imgContainer.height - _viewRect.height - _viewRect.y)*dragPosition.y},true);
    }

    public function updateImages(imagesList:Array):void{
        for (var elementID:uint in imagesList) {
            if(!_displayedImages[elementID]) {
                var imageRenderer:ImageView = new ImageView(imagesList[elementID].bitmapData, _imageHeight);
                _displayedImages[elementID]     = imageRenderer;
                _imgContainer.addChild(imageRenderer);
            }
        }
    }

    override public function resize(width:Number, height:Number):void {
        _viewRect = new Rectangle(this.x,this.y,width,height-this.y);
        _scrollMC.x = _viewRect.width;
        _scrollMC.y = _scrollMC.height / 2;
        _mask.graphics.clear();
        _mask.graphics.beginFill(0x000000);
        _mask.graphics.drawRect(0,_viewRect.y,_viewRect.width, _viewRect.height);
        mask = _mask;
        _scrollBtn.dragRect = new Rectangle(_scrollMC.x,_scrollMC.y,0,_viewRect.height - _scrollMC.height);
    }

    private function set imageHeight(value:uint):void {
        _imageHeight = value;
        updatePositions();

    }

    public function updatePositions():void {
        var row:Array = new Array();
        var currentWidth:Number = 0;
        var rowY:int = 0;
        var image:ImageView;
        for (var imgID:int = 0; imgID < _displayedImages.length; imgID++){
            image = _displayedImages[imgID];
            image.imageHeight = _imageHeight;
            if(currentWidth + image.width > _viewRect.width){
                rowY += positionRow(row, currentWidth, rowY) + GAP;
                row = new Array();
                currentWidth = 0;
            }
            row.push(image);
            currentWidth += image.width;
        }
        if(row.length){
            positionRow(row, currentWidth, rowY);
        }
        updateScrollBar();
    }

    private function updateScrollBar():void {
        _scrollBtn.enable = _scrollMC.visible =_imgContainer.height > _viewRect.height;
        trace("pos",-_imgContainer.y /(_imgContainer.height - _viewRect.height));
        _scrollBtn.updatePosition(0,-_imgContainer.y / (_imgContainer.height - _viewRect.height));
        //_tweenScroll.updateTo({y:-(_imgContainer.height - _viewRect.height - _viewRect.y)*dragPosition.y},true);
    }

    private function positionRow(row:Array, currentWidth:Number, rowY:Number):Number {
        var emptySpace:Number = _viewRect.width - currentWidth - GAP*row.length;
        trace("positionRow", row.length, "rowY", rowY,"emptySpace",emptySpace, emptySpace / row.length);
        var currentHeight:Number = _imageHeight * row.length;
        var difUp:Number = (emptySpace  /_viewRect.width);
        trace("find how much to increase", "currentWidth", currentWidth, currentHeight, difUp, emptySpace);
        var elementX:Number = GAP;
        for (var col:uint = 0; col < row.length; col++) {
            var element:ImageView = row[col];
            var perc:Number = (element.width / currentWidth) * emptySpace;
            var difWidth:Number = (perc + element.width) / element.width;
            element.imageHeight *= difWidth;
            element.y = rowY;
            element.x = elementX;
            elementX += element.width + GAP;
        }
        return element.height;
    }



    override public function destroy():void {
        super.destroy();
    }
}
}
