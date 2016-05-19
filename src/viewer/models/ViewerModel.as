/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer.models {
import flash.display.Bitmap;

import org.osflash.signals.Signal;

import org.robotlegs.mvcs.Actor;

public class ViewerModel extends Actor {
    private var _imagesList:Array;
    public var changeSignal:Signal;
    public function ViewerModel() {
        changeSignal = new Signal();
        super();
        _imagesList = new Array();
    }

    public function addImage(bitmap:Bitmap):void {
        _imagesList.push(bitmap);
        changeSignal.dispatch();
    }

    public function get imagesList():Array {
        return _imagesList;
    }
}
}
