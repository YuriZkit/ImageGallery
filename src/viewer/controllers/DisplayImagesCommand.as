/**
 * Created by YuriZkit-Adm on 5/22/2016.
 */
package viewer.controllers {
import org.robotlegs.mvcs.Command;

import viewer.views.components.GalleryView;

public class DisplayImagesCommand extends Command {

    override public function execute():void {
        super.execute();
        contextView.removeChildAt(0);
        contextView.addChildAt(new GalleryView(),0);
    }
}
}