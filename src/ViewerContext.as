/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package {
import flash.display.DisplayObjectContainer;

import org.robotlegs.base.ContextEvent;
import org.robotlegs.mvcs.Context;

import com.gallery.controllers.AddImageToGalleryCommand;
import com.gallery.controllers.BrowseCommand;
import com.gallery.controllers.ChangeImageSize;
import com.gallery.controllers.DisplayImagesCommand;
import com.gallery.controllers.InitStateMachine;
import com.gallery.controllers.ResizeCommand;
import com.gallery.events.FileLoaderServiceEvent;
import com.gallery.events.ResizeEvent;
import com.gallery.events.TopHudEvent;
import com.gallery.models.GalleryModel;
import com.gallery.services.IFileLoaderService;
import com.gallery.services.LocalFileLoaderService;
import com.gallery.views.components.GalleryView;
import com.gallery.views.components.LoadingView;
import com.gallery.views.components.TopHUDView;
import com.gallery.views.components.WelcomeView;
import com.gallery.views.mediators.ApplicationMediator;
import com.gallery.views.mediators.GalleryMediator;
import com.gallery.views.mediators.LoadingMediator;
import com.gallery.views.mediators.TopHudMediator;
import com.gallery.views.mediators.WelcomeMediator;

public class ViewerContext extends Context {
    public function ViewerContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true) {
        super(contextView, autoStartup);
    }

    override public function startup():void {
        injector.mapSingleton(GalleryModel);
        injector.mapSingleton(TopHUDView);
        injector.mapSingletonOf(IFileLoaderService, LocalFileLoaderService);

        commandMap.mapEvent(ContextEvent.STARTUP, InitStateMachine, ContextEvent, true);
        commandMap.mapEvent(ResizeEvent.RESIZE, ResizeCommand, ResizeEvent);
        commandMap.mapEvent(FileLoaderServiceEvent.IMAGE_LOADED, AddImageToGalleryCommand, FileLoaderServiceEvent);
        commandMap.mapEvent(FileLoaderServiceEvent.ALL_FILES_LOADED, DisplayImagesCommand, FileLoaderServiceEvent);
        commandMap.mapEvent(TopHudEvent.ACTION_BROWSE, BrowseCommand, TopHudEvent);
        commandMap.mapEvent(TopHudEvent.ACTION_IMAGE_SIZE, ChangeImageSize, TopHudEvent);

        mediatorMap.mapView(GalleryView, GalleryMediator);
        mediatorMap.mapView(TopHUDView, TopHudMediator);
        mediatorMap.mapView(Application, ApplicationMediator);
        mediatorMap.mapView(WelcomeView, WelcomeMediator);
        mediatorMap.mapView(LoadingView, LoadingMediator);

        var uiViewDisplayObject = contextView.addChild(new TopHUDView());
        contextView.y           = uiViewDisplayObject.height;
        uiViewDisplayObject.y   = -uiViewDisplayObject.height;

        dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
        super.startup();
    }
}
}
