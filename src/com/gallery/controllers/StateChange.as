/**
 * Created by ymakarov on 24.05.2016.
 */
package com.gallery.controllers {
import com.gallery.models.GalleryModel;

import org.robotlegs.mvcs.Command;
import org.robotlegs.utilities.statemachine.StateEvent;

public class StateChange extends Command {

    [Inject]
    public var event:StateEvent;
    [Inject]
    public var model:GalleryModel;

    override public function execute():void {
        super.execute();
        model.state = event.action;
    }
}
}
