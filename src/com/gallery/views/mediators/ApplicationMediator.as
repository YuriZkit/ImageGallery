/**
 * Created by YuriZkit-Adm on 5/21/2016.
 */
package com.gallery.views.mediators {
import com.gallery.events.ResizeEvent;

import flash.events.Event;
import flash.events.TimerEvent;
import flash.utils.Timer;

import org.robotlegs.mvcs.Mediator;

public class ApplicationMediator extends Mediator {
    [Inject]
    public var view:Application;
    private var resizeTimer:Timer;

    override public function onRegister():void {
        super.onRegister();
        resizeTimer = new Timer(100, 1);
        eventMap.mapListener(resizeTimer, TimerEvent.TIMER_COMPLETE, callResizeCommand);
        eventMap.mapListener(view.stage, Event.RESIZE, onResize);
    }

    private function callResizeCommand(event:TimerEvent):void {
        dispatch(new ResizeEvent(ResizeEvent.RESIZE, view.stage.stageWidth, view.stage.stageHeight));
    }

    private function onResize(event:Event):void {
        resizeTimer.reset();
        resizeTimer.start();
    }
}
}
