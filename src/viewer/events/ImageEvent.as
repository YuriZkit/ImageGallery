/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer.events {
import flash.display.Bitmap;
import flash.events.Event;

public class ImageEvent extends Event {
    public static const IMAGE_LOADED:String = "image_loaded";
    private var _data:Bitmap;
    public function ImageEvent(type:String, data:Bitmap, bubbles:Boolean = false, cancelable:Boolean = false) {
        _data = data;
        super(type, bubbles, cancelable);
    }
    public function get data():Bitmap {
        return _data;
    }
}
}
