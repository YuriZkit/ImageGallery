/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer.views.mediators {


import org.robotlegs.mvcs.Mediator;

import viewer.models.ViewerModel;

import viewer.views.components.GalleryView;

public class GalleryViewMediator extends Mediator {
    [Inject]
    public var view:GalleryView;
    [Inject]
    public var model:ViewerModel;

    override public function onRegister():void {
        view.imageIdealHeight = model.imageIdealHeight;
        view.createChildren();
        model.resizeSignal.add(resize);
        model.imageSizeChangedSignal.add(onImageSizeChanged);
        resize(model.width,model.height);
        updateImages();
    }

    private function onImageSizeChanged():void {
        view.imageIdealHeight = model.imageIdealHeight;
        view.updatePositions();
    }

    public function resize(width:Number, height:Number):void {
        view.resize(width, height);
        view.updatePositions();
    }

    public function updateImages():void {
        view.updateImages(model.imagesList);
        view.updatePositions();
    }
}
}
