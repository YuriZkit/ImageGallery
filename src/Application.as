package {

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.events.TimerEvent;
import flash.geom.Rectangle;
import flash.utils.Timer;

import viewer.views.components.GalleryView;

import viewer.views.components.UIVIew;

public class Application extends Sprite {
    private var _context:ViewerContext;
    private var uiView:UIVIew;
    private var galleryView:GalleryView;
    private var timer:Timer;
    public function Application() {
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;
        timer = new Timer(1000,1);
        timer.addEventListener(TimerEvent.TIMER_COMPLETE, updateViewPorts);
        stage.addEventListener(Event.RESIZE, onResize);
        trace("stage.STAGEWIDTH", stage.stageWidth);
        uiView = new UIVIew();
        uiView.addEventListener(Event.COMPLETE, onUIViewCreated);
        galleryView = new GalleryView();
        _context = new ViewerContext(this);
        _context.contextView.addChild(galleryView);
        _context.contextView.addChild(uiView);
    }

    private function onResize(event:Event):void {
        timer.reset();
        timer.start();

    }

    private function updateViewPorts(event:TimerEvent):void{
        galleryView.viewRect = new Rectangle(0, uiView.height + 1,
                stage.stageWidth, stage.stageHeight - uiView.height);
        uiView.hudWidth = stage.stageWidth;
    }

    private function onUIViewCreated(event:Event):void {
        uiView.removeEventListener(Event.COMPLETE, onUIViewCreated);
        galleryView.y = uiView.height + 1;
        onResize(null);
        trace("stageWidth",stage.stageWidth)
    }
}
}
