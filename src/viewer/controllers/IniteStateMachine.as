/**
 * Created by YuriZkit-Adm on 5/22/2016.
 */
package viewer.controllers {
import org.robotlegs.mvcs.Command;
import org.robotlegs.utilities.statemachine.FSMInjector;
import org.robotlegs.utilities.statemachine.StateMachine;

import viewer.models.StateConfig;

public class IniteStateMachine extends Command {

    override public function execute():void {
        var stateMachineInjector:FSMInjector = new FSMInjector(StateConfig.FSM);
        var stateMachine:StateMachine = new StateMachine(eventDispatcher);
        commandMap.mapEvent(StateConfig.DISPLAY_WELCOME, DisplayWelcomeScreenCommand);
        commandMap.mapEvent(StateConfig.DISPLAY_LOADER, DisplayLoaderCommand);
        commandMap.mapEvent(StateConfig.DISPLAY_GALLERY, DisplayImagesCommand);
        stateMachineInjector.inject(stateMachine);
        super.execute();
    }
}
}
