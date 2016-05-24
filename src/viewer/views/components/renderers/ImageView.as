/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer.views.components.renderers {
import com.greensock.TweenLite;
import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.utils.Timer;

import viewer.models.ImageVO;

public class ImageView extends Sprite {
    private var _height:Number;
    private var _fade:TweenLite;
    private var _imageVO:ImageVO;
    private var _bitmap:Bitmap;

    public function ImageView(imageVO:ImageVO, idealHeight:uint) {
        _imageVO = imageVO;
        _bitmap = new Bitmap(imageVO.bitmapData.clone(),"never",true);
        addChild(_bitmap);
        mouseChildren = false;
        super();
        imageHeight     = idealHeight;
        _mouseDownTimer = new Timer(1000,1);
        addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
        addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
    }
    private var _mouseDownTimer:Timer;
    private function onMouseUp(event:MouseEvent):void {
    }

    private function onMouseDown(event:MouseEvent):void {
    }


    public function onSelect(event:Event):void {
        //TweenLite.to(this,0.5,{colorMatrixFilter:{saturation:0.3}});
    }

    public function get imageVO():ImageVO{
        return _imageVO;
    }

    public function set imageHeight(value:Number):void {
        if (_height != value) {
            _height = value;
            resize();
        }
    }

    public function get imageHeight():Number {
        return _height;
    }

    public function resize():void {
        var heightDif:Number = _height / _bitmap.bitmapData.height;
        scaleX               = scaleY = heightDif;
    }

    public function hide():void {
        TweenLite.to(this, 1, {alpha: 0});
    }
}
}
