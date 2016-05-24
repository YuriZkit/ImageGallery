/**
 * Created by YuriZkit-Adm on 5/23/2016.
 */
package viewer.controllers {
import org.robotlegs.mvcs.Command;

import viewer.events.UIEvent;
import viewer.models.ViewerModel;

public class ChangeImageSize extends Command {
    [Inject]
    public var event:UIEvent;
    [Inject]
    public var model:ViewerModel;
    override public function execute():void {
        model.imageIdealHeight = event.data;
        super.execute();
    }
}
}
