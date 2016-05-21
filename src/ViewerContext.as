/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package {
import flash.display.DisplayObjectContainer;

import org.robotlegs.mvcs.Context;

import viewer.controllers.AddImageToGalleryCommand;
import viewer.controllers.BrowseCommand;
import viewer.controllers.ResizeCommand;
import viewer.events.GalleryEvent;
import viewer.events.ImageEvent;
import viewer.events.UIEvent;
import viewer.models.ViewerModel;
import viewer.services.IFileLoaderService;
import viewer.services.LocalFileLoaderService;
import viewer.views.components.GalleryView;
import viewer.views.components.UIVIew;
import viewer.views.mediators.ApplicationMediator;
import viewer.views.mediators.GalleryViewMediator;
import viewer.views.mediators.UIViewMediator;

public class ViewerContext extends Context {
    public function ViewerContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true) {
        super(contextView, autoStartup);
    }

    override public function startup():void {
        injector.mapSingleton(ViewerModel);
        injector.mapSingletonOf(IFileLoaderService, LocalFileLoaderService);
        injector.mapSingleton(GalleryView);
        commandMap.mapEvent(GalleryEvent.RESIZE, ResizeCommand, GalleryEvent);
        commandMap.mapEvent(ImageEvent.IMAGE_LOADED, AddImageToGalleryCommand, ImageEvent);
        commandMap.mapEvent(UIEvent.ACTION_BROWSE, BrowseCommand, UIEvent);
        mediatorMap.mapView(GalleryView, GalleryViewMediator);
        mediatorMap.mapView(UIVIew, UIViewMediator);
        mediatorMap.mapView(Application, ApplicationMediator);
        super.startup();
    }
}
}
