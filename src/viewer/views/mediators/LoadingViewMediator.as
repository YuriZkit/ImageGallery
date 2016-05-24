/**
 * Created by YuriZkit-Adm on 5/22/2016.
 */
package viewer.views.mediators {
import org.robotlegs.mvcs.Mediator;

import viewer.views.components.LoadingView;

public class LoadingViewMediator extends Mediator {
    [Inject]
    public var view:LoadingView;
    override public function onRegister():void {
        super.onRegister();
        view.createChildren();

    }
}
}
