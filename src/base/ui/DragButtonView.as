/**
 * Created by ymakarov on 20.05.2016.
 */
package base.ui {
import flash.display.MovieClip;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.utils.Timer;

import org.osflash.signals.Signal;

public class DragButtonView extends ButtonView {
    private var _dragRect:Rectangle;
    public var positionChangeSignal:Signal;
    private var _dragPosition:Point = new Point(0,0);
    private var _dragTimer:Timer = new Timer(10);
    public function DragButtonView(target:MovieClip) {
        super(target);
        positionChangeSignal = new Signal();
    }

    public function set dragRect(rect:Rectangle):void{
        _dragRect = rect;
    }

    override protected function setListeners():void {
        super.setListeners();
    }

    override protected function actionDown(event:Event):void {
        super.actionDown(event);
        _target.startDrag(false,_dragRect);
        _target.stage.addEventListener(MouseEvent.MOUSE_UP, actionUp);
        _target.stage.addEventListener(MouseEvent.MOUSE_MOVE, onDragUpdate);
        _dragTimer.start();
    }
    private function onDragUpdate(event:Event = null):void {
        var newPos:Point = new Point();
        newPos.x = (_target.x - _dragRect.x) / _dragRect.width;
        newPos.y = (_target.y - _dragRect.y) / _dragRect.height;
        _dragPosition.y = (_target.y - _dragRect.y) / _dragRect.height;
        _dragPosition.x = (_target.x - _dragRect.x) / _dragRect.width;
        positionChangeSignal.dispatch(_dragPosition);
    }
    public function updatePosition(xPos:Number, yPos:Number):void {
        yPos = (yPos > 1)?1:(yPos<0)?0:yPos;
        xPos = (xPos > 1)?1:(xPos<0)?0:xPos;
        _target.x = (xPos * (_dragRect.width)  + _dragRect.x);
        _target.y = (yPos * (_dragRect.height) + _dragRect.y);
        onDragUpdate();
    }

    override protected function actionUp(event:Event):void {
        super.actionUp(event);
        _target.stopDrag();
        _target.stage.removeEventListener(MouseEvent.MOUSE_UP, actionUp);
        _dragTimer.stop();
        _dragTimer.removeEventListener(TimerEvent.TIMER, onDragUpdate);
        onDragUpdate(null);
    }

}
}
