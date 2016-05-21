/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer.views.components.renderers {
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.PixelSnapping;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;

public class ImageView extends Bitmap {
    private var _height:Number;
    private var pivot:Point;
    public function ImageView(bitmapData:BitmapData = null, idealHeight:uint = 100, pixelSnapping:String = "always", smoothing:Boolean = true) {
        pivot = new Point(0,0);
        trace("new Image", bitmapData.height / idealHeight);
        super(bitmapData, pixelSnapping, smoothing);
        imageHeight = idealHeight;

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
