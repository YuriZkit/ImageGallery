/**
 * Created by ymakarov on 24.05.2016.
 */
package viewer.controllers {
import org.robotlegs.mvcs.Command;
import org.robotlegs.utilities.statemachine.StateEvent;


import viewer.models.ViewerModel;

public class StateChange extends Command {

    [Inject]
    public var event:StateEvent;
    [Inject]
    public var model:ViewerModel;

    override public function execute():void {
        super.execute();
        model.state = event.action;
    }
}
}
