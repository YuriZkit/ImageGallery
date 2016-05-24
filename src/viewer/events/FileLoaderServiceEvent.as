/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer.events {
import flash.display.Bitmap;
import flash.events.Event;

public class FileLoaderServiceEvent extends Event {
    public static const IMAGE_LOADED:String = "image_loaded";
    public static const ALL_FILES_LOADED:String = "all_files_loaded";
    private var _data:Bitmap;
    private var _toLoad:uint;
    public function FileLoaderServiceEvent(type:String, data:Bitmap = null, bubbles:Boolean = false, cancelable:Boolean = false) {
        _data = data;
        super(type, bubbles, cancelable);
    }

    public function get data():Bitmap {
        return _data;
    }
}
}
