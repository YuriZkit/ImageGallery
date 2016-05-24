/**
 * Created by YuriZkit-Adm on 5/22/2016.
 */
package com.gallery.controllers {
import com.gallery.models.GalleryState;

import org.robotlegs.mvcs.Command;
import org.robotlegs.utilities.statemachine.FSMInjector;
import org.robotlegs.utilities.statemachine.StateEvent;
import org.robotlegs.utilities.statemachine.StateMachine;

public class InitStateMachine extends Command {

    override public function execute():void {
        commandMap.mapEvent(StateEvent.CHANGED, StateChange, StateEvent);
        commandMap.mapEvent(GalleryState.DISPLAY_WELCOME, DisplayWelcomeScreenCommand);
        commandMap.mapEvent(GalleryState.DISPLAY_LOADER, DisplayLoaderCommand);
        commandMap.mapEvent(GalleryState.DISPLAY_GALLERY, DisplayImagesCommand);
        var stateMachineInjector:FSMInjector = new FSMInjector(GalleryState.FSM);
        var stateMachine:StateMachine = new StateMachine(eventDispatcher);
        stateMachineInjector.inject(stateMachine);

        super.execute();
    }
}
}
