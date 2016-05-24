/**
 * Created by YuriZkit-Adm on 5/22/2016.
 */
package viewer.views.mediators {

import org.robotlegs.mvcs.Mediator;

import viewer.views.components.WelcomeView;

public class WelcomeViewMediator extends Mediator {
    [Inject]
    public var view:WelcomeView;

    override public function onRegister():void {
        super.onRegister();
        view.createChildren();
    }
}
}
