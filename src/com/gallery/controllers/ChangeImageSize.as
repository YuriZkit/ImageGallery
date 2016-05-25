/**
 * Created by YuriZkit-Adm on 5/23/2016.
 */
package com.gallery.controllers {
import com.gallery.events.TopHudEvent;
import com.gallery.models.GalleryModel;

import org.robotlegs.mvcs.Command;

public class ChangeImageSize extends Command {
    [Inject]
    public var event:TopHudEvent;
    [Inject]
    public var model:GalleryModel;

    override public function execute():void {
        model.imageIdealHeight = event.data;
        super.execute();
    }
}
}
