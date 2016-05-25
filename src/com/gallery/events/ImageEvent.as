/**
 * Created by ymakarov on 24.05.2016.
 */
package com.gallery.events {
import com.gallery.models.ImageVO;

import flash.events.Event;

public class ImageEvent extends Event {
    public static const IMAGE_SELECTED:String = "image_selected";
    private var _imageVO:ImageVO;
    public function ImageEvent(type:String, imageVO:ImageVO, bubbles:Boolean = false, cancelable:Boolean = false) {
        _imageVO = imageVO;
        super(type, bubbles, cancelable);
    }

    public function get imageVO():ImageVO{
        return _imageVO;
    }
}
}
