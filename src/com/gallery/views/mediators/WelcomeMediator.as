/**
 * Created by YuriZkit-Adm on 5/22/2016.
 */
package com.gallery.views.mediators {

import com.gallery.views.components.WelcomeView;

import org.robotlegs.mvcs.Mediator;

public class WelcomeMediator extends Mediator {
    [Inject]
    public var view:WelcomeView;

    override public function onRegister():void {
        super.onRegister();
        view.createChildren();
    }
}
}
