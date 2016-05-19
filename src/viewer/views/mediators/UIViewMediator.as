/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer.views.mediators {

import org.robotlegs.mvcs.Mediator;

import viewer.events.UIEvent;

import viewer.views.components.UIVIew;

public class UIViewMediator extends Mediator {
   [Inject]
    public var view:UIVIew;

    override public function onRegister():void {
        view.createChildren();
        view.browseSignal.add(onBrowseSignal);
    }

    private function onBrowseSignal():void {
        dispatch(new UIEvent(UIEvent.ACTION_BROWSE));
    }

}
}
