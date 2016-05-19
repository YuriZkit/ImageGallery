/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer.views.components.renderers {
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.geom.Point;

public class ImageRenderer extends Bitmap {
    private var _width:int;
    private var _height:int;
    private var pivot:Point;
    public function ImageRenderer(bitmapData:BitmapData = null, width:int = 100, heigth:int = 100, pixelSnapping:String = "auto", smoothing:Boolean = false) {
        _width = width;
        _height = heigth;
        pivot = new Point(0,0);
        super(bitmapData, "auto", true);
        resize();
    }

    private function resize():void{
        var heightDif:Number = _height / height;
            scaleX = scaleY = heightDif;
    }
}
}
