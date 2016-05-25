/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package com.gallery.models {
import flash.display.BitmapData;

public class ImageVO {
    private var _id:String;
    public function ImageVO(id:String, data:BitmapData) {
        _id = id;
        _data = data;
    }

    private var _data:BitmapData;

    public function get bitmapData():BitmapData {
        return _data;
    }

    public function get id():String {
        return _id;
    }
}
}
