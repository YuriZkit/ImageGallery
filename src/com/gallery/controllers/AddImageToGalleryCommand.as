/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package com.gallery.controllers {
import com.gallery.events.FileLoaderServiceEvent;
import com.gallery.models.GalleryModel;

import org.robotlegs.mvcs.Command;

public class AddImageToGalleryCommand extends Command {
    [Inject]
    public var event:FileLoaderServiceEvent;
    [Inject]
    public var model:GalleryModel;

    override public function execute():void {
        model.addImage(this.event.data);
    }
}
}
