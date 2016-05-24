/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer.models {
import flash.display.Bitmap;

import org.osflash.signals.Signal;

import org.robotlegs.mvcs.Actor;

public class ViewerModel extends Actor {
    private var _imagesList:Vector.<ImageVO>;
    public var imageSizeChangedSignal:Signal;
    public var resizeSignal:Signal;
    private var _width:Number;
    private var _height:Number;
    private var _imageIdealHeight:uint = 3;

    public function ViewerModel() {
        imageSizeChangedSignal = new Signal();
        resizeSignal = new Signal();
        super();
        _imagesList = new Vector.<ImageVO>();
    }

    public function set imageIdealHeight(value:uint):void {
        _imageIdealHeight = value;
        imageSizeChangedSignal.dispatch();
    }
    public function get imageIdealHeight():uint {
        return _imageIdealHeight;
    }

    public function resize(width:Number, height:Number):void {
        _width = width;
        _height = height;
        resizeSignal.dispatch(width, height);
    }

    public function get width():Number {
        return _width;
    }

    public function get height():Number {
        return _height;
    }

    public function addImage(bitmap:Bitmap):void {
        _imagesList.push(new ImageVO(_imagesList.length, bitmap.bitmapData));
    }

    public function get imagesList():Vector.<ImageVO> {
        return _imagesList;
    }
}
}
