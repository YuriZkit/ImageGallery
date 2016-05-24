/**
 * Created by YuriZkit-Adm on 5/22/2016.
 */
package viewer.controllers {
import org.robotlegs.mvcs.Command;
import org.robotlegs.utilities.statemachine.FSMInjector;
import org.robotlegs.utilities.statemachine.StateEvent;
import org.robotlegs.utilities.statemachine.StateMachine;

import viewer.models.StateConfig;

public class InitStateMachine extends Command {

    override public function execute():void {
        commandMap.mapEvent(StateEvent.CHANGED, StateChange, StateEvent);
        commandMap.mapEvent(StateConfig.DISPLAY_WELCOME, DisplayWelcomeScreenCommand);
        commandMap.mapEvent(StateConfig.DISPLAY_LOADER, DisplayLoaderCommand);
        commandMap.mapEvent(StateConfig.DISPLAY_GALLERY, DisplayImagesCommand);
        var stateMachineInjector:FSMInjector = new FSMInjector(StateConfig.FSM);
        var stateMachine:StateMachine = new StateMachine(eventDispatcher);
        stateMachineInjector.inject(stateMachine);

        super.execute();
    }
}
}
