/**
 * Created by YuriZkit-Adm on 5/21/2016.
 */
package viewer.controllers {

import org.robotlegs.mvcs.Command;

import viewer.events.GalleryEvent;
import viewer.models.ViewerModel;

public class ResizeCommand extends Command {
    [Inject]
    public var event:GalleryEvent;
    [Inject]
    public var galleryModel:ViewerModel;
    override public function execute():void {
        galleryModel.resize(event.width, event.height);
        super.execute();
    }
}
}
