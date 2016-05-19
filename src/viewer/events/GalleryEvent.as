/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer.events {
import flash.events.Event;

public class GalleryEvent extends Event {
    public static const IMAGE_LIST_CHANGED:String = "image_list_changed";
    public static const UI_CREATED:String = "ui_created";
    public function GalleryEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable);
    }
}
}
