/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer.controllers {
import viewer.events.ImageEvent;

import org.robotlegs.mvcs.Command;

import viewer.services.IFileLoaderService;

public class LoadImageCommand extends Command {
    [Inject]
    public var event:ImageEvent;
    [Inject]
    public var service:IFileLoaderService;


    override public function execute():void {
        super.execute();
    }

    public function load(path:String):void {
        //service.loadFile(path);
        service.loadFile("file");
    }
}
}
