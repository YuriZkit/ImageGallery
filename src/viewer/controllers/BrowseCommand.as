/**
 * Created by YuriZkit-Adm on 5/17/2016.
 */
package viewer.controllers {
import org.robotlegs.mvcs.Command;

import viewer.events.UIEvent;

import viewer.services.IFileLoaderService;

public class BrowseCommand extends Command {
    [Inject]
    public var service:IFileLoaderService;

    override public function execute():void {
        service.browse();
    }
}
}
