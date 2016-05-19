package {

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;

import viewer.views.components.GalleryView;

import viewer.views.components.UIVIew;

public class Application extends Sprite {
    private var _context:ViewerContext;
    private var uiView:UIVIew;
    private var galleryView:GalleryView;
    public function Application() {
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;
        uiView = new UIVIew();
        uiView.addEventListener(Event.COMPLETE, onUIViewCreated);
        galleryView = new GalleryView();
        _context = new ViewerContext(this);
        _context.contextView.addChild(galleryView);
        _context.contextView.addChild(uiView);
    }

    private function onUIViewCreated(event:Event):void {
        uiView.removeEventListener(Event.COMPLETE, onUIViewCreated);
        galleryView.y = uiView.height + 1;
    }
}
}
