/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer.views.mediators {

import org.robotlegs.mvcs.Mediator;

import viewer.events.UIEvent;
import viewer.models.ViewerModel;

import viewer.views.components.UIVIew;

public class UIViewMediator extends Mediator {
    [Inject]
    public var view:UIVIew;

    [Inject]
    public var model:ViewerModel;

    override public function onRegister():void {
        view.createChildren();
        view.browseSignal.add(onBrowseSignal);
        model.resizeSignal.add(view.resize);
    }

    private function onBrowseSignal():void {
        dispatch(new UIEvent(UIEvent.ACTION_BROWSE));
    }

}
}
