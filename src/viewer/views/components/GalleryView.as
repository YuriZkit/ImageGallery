/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer.views.components {
import base.BaseView;


import viewer.views.components.renderers.ImageRenderer;

public class GalleryView extends BaseView {

    private var _displayedImages:Array;
    public function GalleryView() {
        super();
        _displayedImages = new Array();
    }

    override public function createChildren():void {
        super.createChildren();
        trace("this")
    }

    public function updateImages(imagesList:Array):void{
        for (var elementID:uint in imagesList) {
            if(!_displayedImages[elementID]) {
                var imageRenderer:ImageRenderer = new ImageRenderer(imagesList[elementID].bitmapData, 100, 100);
                _displayedImages[elementID]     = imageRenderer;
                addChild(imageRenderer);
            }
        }
        updatePositions();
    }

    private function updatePositions():void {
        var _x:int = 0;
        var _y:int = 0;
        for (var elementID:int in _displayedImages){
            var image:ImageRenderer = _displayedImages[elementID];
            image.x = _x;
            _x += image.width
        }
    }

    override public function destroy():void {
        super.destroy();
    }
}
}
