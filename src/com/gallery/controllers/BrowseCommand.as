/**
 * Created by YuriZkit-Adm on 5/17/2016.
 */
package com.gallery.controllers {
import com.gallery.services.IFileLoaderService;

import org.robotlegs.mvcs.Command;

public class BrowseCommand extends Command {
    [Inject]
    public var service:IFileLoaderService;

    override public function execute():void {
        service.browse();
    }
}
}
