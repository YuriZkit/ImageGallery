/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package com.gallery.models {
import flash.display.Bitmap;

import org.osflash.signals.Signal;
import org.robotlegs.mvcs.Actor;

public class ViewerModel extends Actor {
    public function ViewerModel() {
        imageSizeChangedSignal = new Signal();
        stateChangeSignal = new Signal();
        resizeSignal = new Signal();
        super();
        _imagesList = new Vector.<ImageVO>();
    }
    public var imageSizeChangedSignal:Signal;
    public var stateChangeSignal:Signal;
    public var resizeSignal:Signal;
    private var _currentState:String;

    private var _imagesList:Vector.<ImageVO>;

    public function get imagesList():Vector.<ImageVO> {
        return _imagesList;
    }

    private var _width:Number;

    public function get width():Number {
        return _width;
    }

    private var _height:Number;

    public function get height():Number {
        return _height;
    }

    private var _imageIdealHeight:uint = 3;

    public function get imageIdealHeight():uint {
        return _imageIdealHeight;
    }

    public function set imageIdealHeight(value:uint):void {
        _imageIdealHeight = value;
        imageSizeChangedSignal.dispatch();
    }

    public function get state():String {
        return _currentState;
    }

    public function set state(value:String):void {
        _currentState = value;
        stateChangeSignal.dispatch(_currentState);
    }

    public function resize(width:Number, height:Number):void {
        _width = width;
        _height = height;
        resizeSignal.dispatch(width, height);
    }

    public function addImage(bitmap:Bitmap):void {
        _imagesList.push(new ImageVO(_imagesList.length, bitmap.bitmapData));
    }
}
}
