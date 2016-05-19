/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer.views.components {
import base.BaseView;

import flash.geom.Rectangle;

import viewer.views.components.renderers.ImageRenderer;

public class GalleryView extends BaseView {

    private var _displayedImages:Array;
    private var _viewRect:Rectangle;
    private var _imageHeight:uint = 200;
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
                var imageRenderer:ImageRenderer = new ImageRenderer(imagesList[elementID].bitmapData, _imageHeight);
                _displayedImages[elementID]     = imageRenderer;
                addChild(imageRenderer);
            }
        }
        updatePositions();
    }

    public function set viewRect(value:Rectangle):void {
        _viewRect = value;
        updatePositions();
    }

    private function set imageHeight(value:uint):void {
        _imageHeight = value;
        updatePositions();
    }

    private function updatePositions():void {
        var image:ImageRenderer;
        var row:Array = new Array();
        var currentWidth:Number = 0;
        var rowY:int = 0;
        var image:ImageRenderer;
        for (var imgID:int = 0; imgID < _displayedImages.length; imgID++){
            image = _displayedImages[imgID];
            image.imageHeight = _imageHeight;
            if(currentWidth + image.width > _viewRect.width){
                rowY += positionRow(row, currentWidth, rowY) + 5;
                row = new Array();
                currentWidth = 0;
            }
            row.push(image);
            currentWidth += image.width;
        }
        if(row.length){
            positionRow(row, currentWidth, rowY);
        }
        /*for (var elementID:int in _displayedImages){
            image = _displayedImages[elementID];
            image.imageHeight = _imageHeight;
            image.x = _x;
            image.y = _y;
            _x += image.width;
            if(_x > _viewRect.width) {
                _x = 0;
                _y += _imageHeight;
            }
        }*/
    }

    private function positionRow(row:Array, currentWidth:Number, rowY:Number):Number {
        var emptySpace:Number = _viewRect.width - currentWidth;
        trace("positionRow", row.length, "rowY", rowY,"emptySpace",emptySpace, emptySpace / row.length);
        var currentHeight:Number = _imageHeight * row.length;
        var difUp:Number = (emptySpace  /_viewRect.width);
        trace("find how much to increase", "currentWidth", currentWidth, currentHeight, difUp, emptySpace);
        var dif:Number = (emptySpace / (row.length + 1));
        var elementX:Number = 0;
        for (var col:uint = 0; col < row.length; col++) {
            var element:ImageRenderer = row[col];
            var perc:Number = (element.width / currentWidth) * emptySpace;
            var difWidth:Number = (perc + element.width) / element.width;
            element.imageHeight *= difWidth;
            element.y = rowY;
            element.x = elementX;
            elementX += element.width;
        }
        return element.height;
    }



    override public function destroy():void {
        super.destroy();
    }
}
}
