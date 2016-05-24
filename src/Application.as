package {

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

public class Application extends Sprite {
    private var _context:ViewerContext;
    public function Application() {
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;
        _context = new ViewerContext(this);

    }
}
}
