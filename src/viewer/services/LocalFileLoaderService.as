/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer.services {
import flash.display.Bitmap;
import flash.display.Bitmap;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.events.Event;
import flash.events.FileListEvent;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.net.FileFilter;
import flash.utils.ByteArray;
import flash.utils.CompressionAlgorithm;

import viewer.events.ImageEvent;

import flash.display.BitmapData;

import flash.filesystem.File;

import org.robotlegs.mvcs.Actor;

public class LocalFileLoaderService extends Actor implements IFileLoaderService{

    public static const IMAGE_FILTER:FileFilter = new FileFilter("Images", "*.jpg;*.gif;*.png");
    private var fileBrowser:File;
    private var filesToLoad:Array;

    public function LocalFileLoaderService() {
        super();
        fileBrowser = new File();
    }

    public function loadFileList(list:Array):void {
    }

    public function browse():void {
        fileBrowser.addEventListener(FileListEvent.SELECT_MULTIPLE, onSelectedBrowser)
        fileBrowser.addEventListener(Event.CANCEL, onCancelBrowser);
        fileBrowser.browseForOpenMultiple("Choose Images", [IMAGE_FILTER]);
    }

    private function onCancelBrowser(event:Event):void {
        trace("onCancel");
    }

    private function onSelectedBrowser(event:FileListEvent):void {
        filesToLoad = event.files;
        loadFileTemp(filesToLoad.pop());
    }


    public function loadFile(path:String):void {
    }

    private function loadFileTemp(file:File):void {
        file.addEventListener(Event.COMPLETE, onFileLoaded);
        file.load();
    }

    private function onFileLoaded(event:Event):void {
        var loader:Loader = new Loader();
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoaded);
        loader.loadBytes((event.target as File).data);
        trace(event);
        //dispatch(new ImageEvent(ImageEvent.IMAGE_LOADED))
    }

    private function onImageLoaded(event:Event):void {
        var bmp:Bitmap = (event.currentTarget as LoaderInfo).content as Bitmap;
        dispatch(new ImageEvent(ImageEvent.IMAGE_LOADED, bmp));
    }
}
}
