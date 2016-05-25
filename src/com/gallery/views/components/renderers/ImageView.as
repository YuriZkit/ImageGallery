/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package com.gallery.views.components.renderers {
import com.gallery.events.ImageEvent;
import com.gallery.models.ImageVO;
import com.greensock.TweenLite;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.utils.Timer;

public class ImageView extends Sprite {
    public function ImageView(imageVO:ImageVO, idealHeight:uint) {
        _imageVO = imageVO;
        _bitmap = new Bitmap(imageVO.bitmapData.clone(), "never", true);
        addChild(_bitmap);
        mouseChildren = false;
        super();
        imageHeight = idealHeight;
        _mouseDownTimer = new Timer(1000, 1);
        addEventListener(MouseEvent.CLICK, onClick);
    }
    private var _height:Number;
    private var _fade:TweenLite;
    private var _bitmap:Bitmap;
    private var _mouseDownTimer:Timer;

    private var _imageVO:ImageVO;

    public function get imageVO():ImageVO {
        return _imageVO;
    }

    public function get imageHeight():Number {
        return _height;
    }

    public function set imageHeight(value:Number):void {
        if (_height != value) {
            _height = value;
            resize();
        }
    }

    public function resize():void {
        var heightDif:Number = _height / _bitmap.bitmapData.height;
        scaleX = scaleY = heightDif;
    }

    public function hide():void {
        TweenLite.to(this, 1, {alpha: 0});
    }

    public function onClick(event:Event):void {
        dispatchEvent(new ImageEvent(ImageEvent.IMAGE_SELECTED, _imageVO));
        //TweenLite.to(this,0.5,{colorMatrixFilter:{saturation:0.3}});
    }

    public function set select(value:Boolean):void {
        TweenLite.to(this,0.5,{colorMatrixFilter:{saturation:0.3}});
    }

    private function onMouseUp(event:MouseEvent):void {
    }

    private function onMouseDown(event:MouseEvent):void {
    }
}
}
