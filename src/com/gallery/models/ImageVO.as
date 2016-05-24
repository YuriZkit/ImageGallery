/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package com.gallery.models {
import flash.display.BitmapData;

public class ImageVO {
    public function ImageVO(id:uint, data:BitmapData) {
        _data = data;
    }
    private var _data:BitmapData;

    public function get bitmapData():BitmapData {
        return _data;
    }
}
}
