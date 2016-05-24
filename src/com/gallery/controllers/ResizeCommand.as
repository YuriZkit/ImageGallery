/**
 * Created by YuriZkit-Adm on 5/21/2016.
 */
package com.gallery.controllers {

import com.gallery.events.GalleryEvent;
import com.gallery.models.ViewerModel;

import org.robotlegs.mvcs.Command;

public class ResizeCommand extends Command {
    [Inject]
    public var event:GalleryEvent;
    [Inject]
    public var galleryModel:ViewerModel;

    override public function execute():void {
        galleryModel.resize(event.width, event.height - contextView.getChildAt(1).height);
        super.execute();
    }
}
}
