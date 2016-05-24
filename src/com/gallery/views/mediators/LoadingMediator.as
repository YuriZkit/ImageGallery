/**
 * Created by YuriZkit-Adm on 5/22/2016.
 */
package com.gallery.views.mediators {
import com.gallery.views.components.LoadingView;

import org.robotlegs.mvcs.Mediator;

public class LoadingMediator extends Mediator {
    [Inject]
    public var view:LoadingView;

    override public function onRegister():void {
        super.onRegister();
        view.createChildren();
    }
}
}
