/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer.views.components.renderers {
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.geom.Point;

public class ImageRenderer extends Bitmap {
    private var _height:Number;
    private var _width:Number;
    private var pivot:Point;
    private var aspectRation:Point
    public function ImageRenderer(bitmapData:BitmapData = null, heigth:uint = 100, pixelSnapping:String = "auto", smoothing:Boolean = false) {
        pivot = new Point(0,0);
        super(bitmapData, "auto", true);
        imageHeight = heigth;
    }
    public function set imageHeight(value:Number):void {
        if(_height != value) {
            _height = value;
            resize();
        }
    }

    public function get imageHeight():Number {
        return _height;
    }

    public function resize():void{
        var heightDif:Number = _height / bitmapData.height;
            scaleX = scaleY = heightDif;
    }
}
}
