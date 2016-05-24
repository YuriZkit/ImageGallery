/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package {
import flash.display.DisplayObjectContainer;

import org.robotlegs.base.ContextEvent;
import org.robotlegs.mvcs.Context;

import viewer.controllers.AddImageToGalleryCommand;
import viewer.controllers.BrowseCommand;
import viewer.controllers.ChangeImageSize;
import viewer.controllers.DisplayImagesCommand;
import viewer.controllers.IniteStateMachine;
import viewer.controllers.ResizeCommand;
import viewer.events.FileLoaderServiceEvent;
import viewer.events.GalleryEvent;
import viewer.events.UIEvent;
import viewer.models.ViewerModel;
import viewer.services.IFileLoaderService;
import viewer.services.LocalFileLoaderService;
import viewer.views.components.GalleryView;
import viewer.views.components.LoadingView;
import viewer.views.components.UIVIew;
import viewer.views.components.WelcomeView;
import viewer.views.mediators.ApplicationMediator;
import viewer.views.mediators.GalleryViewMediator;
import viewer.views.mediators.LoadingViewMediator;
import viewer.views.mediators.UIViewMediator;
import viewer.views.mediators.WelcomeViewMediator;

public class ViewerContext extends Context {
    public function ViewerContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true) {
        super(contextView, autoStartup);
    }

    override public function startup():void {
        injector.mapSingleton(ViewerModel);
        injector.mapSingleton(UIVIew);
        injector.mapSingletonOf(IFileLoaderService, LocalFileLoaderService);

        commandMap.mapEvent(ContextEvent.STARTUP, IniteStateMachine, ContextEvent, true);
        commandMap.mapEvent(GalleryEvent.RESIZE, ResizeCommand, GalleryEvent);
        commandMap.mapEvent(FileLoaderServiceEvent.IMAGE_LOADED, AddImageToGalleryCommand, FileLoaderServiceEvent);
        commandMap.mapEvent(FileLoaderServiceEvent.ALL_FILES_LOADED, DisplayImagesCommand, FileLoaderServiceEvent);
        commandMap.mapEvent(UIEvent.ACTION_BROWSE, BrowseCommand, UIEvent);
        commandMap.mapEvent(UIEvent.ACTION_IMAGE_SIZE, ChangeImageSize, UIEvent);

        mediatorMap.mapView(GalleryView, GalleryViewMediator);
        mediatorMap.mapView(UIVIew, UIViewMediator);
        mediatorMap.mapView(Application, ApplicationMediator);
        mediatorMap.mapView(WelcomeView, WelcomeViewMediator);
        mediatorMap.mapView(LoadingView, LoadingViewMediator);
        var uiViewDisplayObject = contextView.addChild(new UIVIew());
        contextView.y           = uiViewDisplayObject.height;
        uiViewDisplayObject.y   = -uiViewDisplayObject.height;
        dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
        super.startup();
    }
}
}
