/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package com.gallery.events {
import flash.display.Bitmap;
import flash.events.Event;

public class FileLoaderServiceEvent extends Event {
    public static const IMAGE_LOADED:String = "image_loaded";
    public static const ALL_FILES_LOADED:String = "all_files_loaded";

    public function FileLoaderServiceEvent(type:String, data:Bitmap = null, bubbles:Boolean = false, cancelable:Boolean = false) {
        _data = data;
        super(type, bubbles, cancelable);
    }
    private var _toLoad:uint;

    private var _data:Bitmap;

    public function get data():Bitmap {
        return _data;
    }
}
}
