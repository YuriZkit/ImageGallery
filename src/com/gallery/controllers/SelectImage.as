/**
 * Created by ymakarov on 24.05.2016.
 */
package com.gallery.controllers {
import com.gallery.events.ImageEvent;
import com.gallery.models.GalleryModel;

import org.robotlegs.mvcs.Command;

public class SelectImage extends Command {
    [Inject]
    public var model:GalleryModel;
    [Inject]
    public var event:ImageEvent;
    override public function execute():void {
        super.execute();
        model.selectImage(event.imageVO);
    }
}
}
