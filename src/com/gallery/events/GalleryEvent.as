/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package com.gallery.events {
import flash.events.Event;

public class GalleryEvent extends Event {
    public static const RESIZE:String = "resize";

    public function GalleryEvent(type:String, width:int, height:int, bubbles:Boolean = false, cancelable:Boolean = false) {
        _width = width;
        _height = height;
        super(type, bubbles, cancelable);
    }

    private var _width:int;

    public function get width():int {
        return _width;
    }

    private var _height:int;

    public function get height():int {
        return _height;
    }
}
}
