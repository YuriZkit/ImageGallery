/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer.controllers {
import org.robotlegs.mvcs.Command;
import viewer.events.ImageEvent;
import viewer.models.ViewerModel;

public class AddImageToGalleryCommand extends Command {
    [Inject]
    public var event:ImageEvent;
    [Inject]
    public var model:ViewerModel;

    override public function execute():void {
        model.addImage(this.event.data);
    }
}
}
