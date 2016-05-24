/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package com.gallery.views.mediators {


import com.gallery.models.ViewerModel;
import com.gallery.views.components.GalleryView;

import org.robotlegs.mvcs.Mediator;

public class GalleryMediator extends Mediator {
    [Inject]
    public var view:GalleryView;
    [Inject]
    public var model:ViewerModel;

    override public function onRegister():void {
        view.imageIdealHeight = model.imageIdealHeight;
        view.createChildren();
        model.resizeSignal.add(resize);
        model.imageSizeChangedSignal.add(onImageSizeChanged);
        resize(model.width, model.height);
        updateImages();
    }

    public function resize(width:Number, height:Number):void {
        view.resize(width, height);
        view.updatePositions();
    }

    public function updateImages():void {
        view.updateImages(model.imagesList);
        view.updatePositions();
    }

    private function onImageSizeChanged():void {
        view.imageIdealHeight = model.imageIdealHeight;
        view.updatePositions();
    }
}
}
