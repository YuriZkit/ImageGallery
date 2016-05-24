/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer.services {
import flash.display.Bitmap;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.events.Event;
import flash.events.FileListEvent;
import flash.filesystem.File;
import flash.net.FileFilter;
import flash.utils.Dictionary;

import org.robotlegs.mvcs.Actor;
import org.robotlegs.utilities.statemachine.StateEvent;

import viewer.events.FileLoaderServiceEvent;
import viewer.models.StateConfig;

public class LocalFileLoaderService extends Actor implements IFileLoaderService {

    public static const IMAGE_FILTER:FileFilter = new FileFilter("Images", "*.jpg;*.gif;*.png");

    public function LocalFileLoaderService() {
        super();
        fileBrowser = new File();
    }
    private var fileBrowser:File;
    private var filesToLoad:uint;

    public function browse():void {
        fileBrowser.addEventListener(FileListEvent.SELECT_MULTIPLE, onSelectedBrowser);
        fileBrowser.addEventListener(Event.CANCEL, onCancelBrowser);
        fileBrowser.browseForOpenMultiple("Choose Images", [IMAGE_FILTER]);
    }

    public function loadFile(file:File):void {
        file.addEventListener(Event.COMPLETE, onFileLoaded);
        file.load();
    }

    private function onCancelBrowser(event:Event):void {
        trace("onCancel");
    }

    private function onSelectedBrowser(event:FileListEvent):void {
        dispatch(new StateEvent(StateEvent.ACTION, StateConfig.LOADING_STARTED));
        filesToLoad = event.files.length;
        for(var i:uint = 0; i < filesToLoad; i++){
            loadFile(event.files[i]);
        }
    }

    private function onFileLoaded(event:Event):void {
        event.currentTarget.removeEventListener(Event.COMPLETE, onFileLoaded);
        var imageLoader:Loader = new Loader();
        imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoaded);
        imageLoader.loadBytes((event.target as File).data);
    }

    private function onImageLoaded(event:Event):void {
        event.currentTarget.removeEventListener(Event.COMPLETE, onImageLoaded);
        var bmp:Bitmap = (event.currentTarget as LoaderInfo).content as Bitmap;
        dispatch(new FileLoaderServiceEvent(FileLoaderServiceEvent.IMAGE_LOADED, bmp));
        filesToLoad--;
        if(filesToLoad == 0) {
            dispatch(new StateEvent(StateEvent.ACTION, StateConfig.LOADING_COMPLETED));
        }
    }
}
}
