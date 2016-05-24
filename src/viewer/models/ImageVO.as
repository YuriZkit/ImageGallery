/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer.models {
import flash.display.BitmapData;

public class ImageVO {
    private var _data:BitmapData;
    public function ImageVO(id:uint, data:BitmapData) {
        _data = data;
    }

    public function get bitmapData():BitmapData {
        return _data;
    }
}
}
