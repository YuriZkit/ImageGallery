package base.ui {

import flash.display.MovieClip;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.MouseEvent;

[Event(name="click", type="flash.events.MouseEvent")]
public class ButtonView extends EventDispatcher {
    protected static const STATE_NORMAL:uint = 0;
    protected static const STATE_OVER:uint = 1;
    protected static const STATE_DOWN:uint = 2;
    protected static const STATE_DISABLED:uint = 3;
    protected var _target:MovieClip;

    public function ButtonView(target:MovieClip) {
        _target = target;
        _target.useHandCursor = true;
        state = STATE_NORMAL;
        updateEnableState();
    }
    protected var _currentState:uint = 0;
    protected var _prevState:int = 0;

    protected var _enable:Boolean = true;

    public function set enable(value:Boolean):void {
        _target.enabled = value;
        updateEnableState();
    }

    public function get state():uint {
        return _currentState;
    }

    public function set state(value:uint):void {
        _currentState = value;
        updateFrameByState();
    }

    public function destroy():void {
        removeListeners();
        _target = null;
    }


    override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
        _target.addEventListener(type, listener, useCapture, priority, useWeakReference);
    }

    override public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void {
        _target.removeEventListener(type, listener, useCapture);
    }

    [cppcall]
    override public function dispatchEvent(event:Event):Boolean {
        return _target.dispatchEvent(event);
    }

    override public function hasEventListener(type:String):Boolean {
        return _target.hasEventListener(type);
    }

    override public function willTrigger(type:String):Boolean {
        return _target.willTrigger(type);
    }

    protected function setListeners():void {
        _target.addEventListener(MouseEvent.CLICK, actionTouch, false, 0);
        _target.addEventListener(MouseEvent.ROLL_OUT, actionOut, false, 1);
        _target.addEventListener(MouseEvent.ROLL_OVER, actionOver, false, 1);
        _target.addEventListener(MouseEvent.MOUSE_DOWN, actionDown, false, 1);
        _target. addEventListener(MouseEvent.MOUSE_UP, actionUp, false, 1);
    }

    protected function removeListeners():void {
        _target.removeEventListener(MouseEvent.ROLL_OUT, actionOut);
        _target.removeEventListener(MouseEvent.ROLL_OVER, actionOver);
        _target.removeEventListener(MouseEvent.MOUSE_DOWN, actionDown);
        _target.removeEventListener(MouseEvent.MOUSE_UP, actionUp);
        _target.removeEventListener(MouseEvent.CLICK, actionTouch);
    }

    protected function updateEnableState():void {
        if (_enable) {
            _target.mouseEnabled = true;
            if (!hasEventListener(MouseEvent.ROLL_OUT)) {
                setListeners();
            }
            if (state == STATE_DISABLED) {
                state = STATE_NORMAL;
            }
        } else {
            state = STATE_DISABLED;
            _target.mouseEnabled = false;
            removeListeners();
        }
    }

    protected function actionTouch(event:Event):void {
        if (!_enable) {
            event.preventDefault();
            event.stopImmediatePropagation();
            return;
        }
    }

    protected function actionUp(event:Event):void {
        if (!_enable)
            return;
        state = _prevState;
    }

    protected function actionOver(event:Event):void {
        if (_enable != true) {
            return;
        }
        state = STATE_OVER;
    }

    protected function actionOut(event:Event):void {
        if (!_enable)
            return;
        state = STATE_NORMAL;
    }

    protected function actionDown(event:Event):void {
        if (!_enable)
            return;
        _prevState = state;
        state = STATE_DOWN;
    }

    private function updateFrameByState():void {
        _target.gotoAndStop(state + 1);
    }
}
}