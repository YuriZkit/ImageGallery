/**
 * Created by YuriZkit-Adm on 5/21/2016.
 */
package viewer.views.mediators {
import flash.events.Event;
import flash.events.TimerEvent;
import flash.utils.Timer;

import org.robotlegs.mvcs.Mediator;

import viewer.events.GalleryEvent;

public class ApplicationMediator extends Mediator {
    [Inject]
    public var view:Application;
    private var resizeTimer:Timer;
    override public function onRegister():void {
        super.onRegister();
        resizeTimer = new Timer(500,1);
        eventMap.mapListener(resizeTimer,TimerEvent.TIMER_COMPLETE, callResizeCommand);
        eventMap.mapListener(view.stage, Event.RESIZE, onResize);
    }

    private function callResizeCommand(event:TimerEvent):void {
        dispatch(new GalleryEvent(GalleryEvent.RESIZE, view.stage.stageWidth, view.stage.stageHeight));
    }

    private function onResize(event:Event):void {
        resizeTimer.reset();
        resizeTimer.start();
    }
}
}
