/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package com.gallery.views.mediators {

import com.gallery.events.TopHudEvent;
import com.gallery.models.GalleryModel;
import com.gallery.views.components.TopHUDView;

import org.robotlegs.mvcs.Mediator;

public class TopHudMediator extends Mediator {
    [Inject]
    public var view:TopHUDView;

    [Inject]
    public var model:GalleryModel;

    override public function onRegister():void {
        view.createChildren();
        view.browseSignal.add(onBrowseSignal);
        view.imageSizeChange.add(onImageSizeChanged);
        model.resizeSignal.add(view.resize);
        model.stateChangeSignal.add(view.updateButtonsState);
    }

    private function onImageSizeChanged(value:uint):void {
        dispatch(new TopHudEvent(TopHudEvent.ACTION_IMAGE_SIZE, value));
    }

    private function onBrowseSignal():void {
        dispatch(new TopHudEvent(TopHudEvent.ACTION_BROWSE));
    }

}
}
