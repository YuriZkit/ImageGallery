/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package {
import org.robotlegs.core.IInjector;

import viewer.controllers.AddImageToGalleryCommand;
import viewer.controllers.BrowseCommand;
import viewer.events.GalleryEvent;

import viewer.events.ImageEvent;

import flash.display.DisplayObjectContainer;

import viewer.events.UIEvent;

import viewer.models.ViewerModel;

import org.robotlegs.mvcs.Context;

import viewer.services.IFileLoaderService;
import viewer.services.LocalFileLoaderService;

import viewer.views.components.GalleryView;
import viewer.views.components.UIVIew;
import viewer.views.mediators.GalleryViewMediator;
import viewer.views.mediators.UIViewMediator;

public class ViewerContext extends Context {
    public function ViewerContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true) {
        super(contextView, autoStartup);
    }

    override public function startup():void {
        injector.mapSingleton(ViewerModel);
        injector.mapSingletonOf(IFileLoaderService, LocalFileLoaderService);
        commandMap.mapEvent(ImageEvent.IMAGE_LOADED, AddImageToGalleryCommand, ImageEvent);
        commandMap.mapEvent(UIEvent.ACTION_BROWSE, BrowseCommand, UIEvent);
        mediatorMap.mapView(GalleryView, GalleryViewMediator);
        mediatorMap.mapView(UIVIew, UIViewMediator);
        super.startup();
    }
}
}
