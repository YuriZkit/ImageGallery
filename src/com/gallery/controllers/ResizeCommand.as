/**
 * Created by YuriZkit-Adm on 5/21/2016.
 */
package com.gallery.controllers {

import com.gallery.events.ResizeEvent;
import com.gallery.models.GalleryModel;

import org.robotlegs.mvcs.Command;

public class ResizeCommand extends Command {
    [Inject]
    public var event:ResizeEvent;
    [Inject]
    public var galleryModel:GalleryModel;

    override public function execute():void {
        galleryModel.resize(event.width, event.height - contextView.getChildAt(1).height);
        super.execute();
    }
}
}
