/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package com.gallery.models {
import flash.display.Bitmap;
import flash.utils.Dictionary;

import org.osflash.signals.Signal;
import org.robotlegs.mvcs.Actor;

public class GalleryModel extends Actor {
    public function GalleryModel() {
        imageSizeChangedSignal = new Signal();
        stateChangeSignal = new Signal();
        resizeSignal = new Signal();
        imageSelectionChanged = new Signal();
        super();
        _imagesList = new Vector.<ImageVO>();
        _selectedImages = new Dictionary();
    }
    public var imageSizeChangedSignal:Signal;
    public var stateChangeSignal:Signal;
    public var resizeSignal:Signal;
    public var imageSelectionChanged:Signal;
    private var _currentState:String;
    private var _selectedImages:Dictionary;

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

    public function selectImage(imageVO:ImageVO):void{
        if(_selectedImages[imageVO]){
            unselectImage(imageVO);
        } else {
            _selectedImages[imageVO] = imageVO.id;
        }
        imageSelectionChanged.dispatch();
    }

    public function unselectImage(imageVO:ImageVO):void {
        delete _selectedImages[imageVO];
    }

    public function unselectAllImages():void {
        for (var imageVO:ImageVO in _selectedImages){
            unselectImage(imageVO);
        }
    }

    public function deleteImage(imageVO:ImageVO):void {
        var imgToDelete:ImageVO = _imagesList[imageVO.id];
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
        _imagesList.push(new ImageVO(_imagesList.length.toString(), bitmap.bitmapData));
    }
}
}
