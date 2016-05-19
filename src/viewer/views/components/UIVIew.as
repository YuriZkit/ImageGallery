/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer.views.components {
import assets.basebutton;

import base.BaseView;
import base.ui.ButtonView;
import flash.display.Shape;
import flash.events.MouseEvent;

import org.osflash.signals.Signal;

public class UIVIew extends BaseView {
    private var _browseBtn:ButtonView;
    private var _browseMC:basebutton;
    private var _horizontalLine:Shape;
    public var browseSignal:Signal;
    public function UIVIew() {
        browseSignal = new Signal();
        super();
    }

    override public function createChildren():void {
        _browseMC = new basebutton();
        _browseMC.txt.text = "BROWSE";
        _browseBtn = new ButtonView(_browseMC);
        _browseBtn.addEventListener(MouseEvent.CLICK, onBrowseClick);
        _horizontalLine = new Shape();
        _horizontalLine.graphics.lineStyle(4,0x0000FF);
        _horizontalLine.graphics.lineTo(stage.stageWidth, 0);
        _horizontalLine.y = _browseMC.height + 1;
        addChild(_browseMC);
        addChild(_horizontalLine);
        super.createChildren();
    }

    private function onBrowseClick(event:MouseEvent):void {
       browseSignal.dispatch();
    }

    override public function destroy():void {
        super.destroy();
        _browseBtn.destroy();
        _browseBtn = null;
        _browseMC = null;
    }
}
}
