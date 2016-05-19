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
        view.createChildren();
        model.changeSignal.add(updateImages);
    }

    public function updateImages():void{
        view.updateImages(model.imagesList);
    }
}
}
