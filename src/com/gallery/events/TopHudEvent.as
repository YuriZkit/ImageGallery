/**
 * Created by YuriZkit-Adm on 5/17/2016.
 */
package com.gallery.events {
import flash.events.Event;

public class TopHudEvent extends Event {
    public static const ACTION_BROWSE:String = "action_browse";
    public static const ACTION_IMAGE_SIZE:String = "action_image_size";

    public function TopHudEvent(type:String, data:* = null, bubbles:Boolean = false, cancelable:Boolean = false) {
        _data = data;
        super(type, bubbles, cancelable);
    }

    private var _data:*;

    public function get data():* {
        return _data;
    }
}
}
