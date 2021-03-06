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

    public function ButtonView(target:MovieClip) {
        _target = target;
        setHitArea();
        state = STATE_NORMAL;
        updateEnableState();
    }
    protected var _mcHitArea:MovieClip;
    protected var _target:MovieClip;
    protected var _currentState:uint = 0;
    protected var _prevState:int = 0;

    public function get enabled():Boolean {
        return _target.enabled;
    }

    public function set enabled(value:Boolean):void {
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

    override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
        _target.addEventListener(type, listener, useCapture, priority, useWeakReference);
    }

    override public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void {
        _target.removeEventListener(type, listener, useCapture);
    }

    override public function hasEventListener(type:String):Boolean {
        return _target.hasEventListener(type);
    }

    override public function willTrigger(type:String):Boolean {
        return _target.willTrigger(type);
    }

    public function destroy():void {
        removeListeners();
        _target = null;
    }

    protected function setHitArea(mcHitArea:MovieClip = null):void {
        if (!mcHitArea) {
            if (_target.hasOwnProperty("hit")) {
                _mcHitArea = _target.getChildByName("hit") as MovieClip;
            }
        } else {
            _mcHitArea = mcHitArea;
        }

        if (_mcHitArea) {
            _target.hitArea = _mcHitArea;
            _mcHitArea.mouseEnabled = false;
            _mcHitArea.visible = false;
        }
        _target.mouseChildren = false;
        _target.useHandCursor = true;
    }

    protected function setListeners():void {
        _target.addEventListener(MouseEvent.CLICK, actionTouch, false, 0);
        _target.addEventListener(MouseEvent.ROLL_OUT, actionOut, false, 1);
        _target.addEventListener(MouseEvent.ROLL_OVER, actionOver, false, 1);
        _target.addEventListener(MouseEvent.MOUSE_DOWN, actionDown, false, 1);
        _target.addEventListener(MouseEvent.MOUSE_UP, actionUp, false, 1);
    }

    protected function removeListeners():void {
        _target.removeEventListener(MouseEvent.ROLL_OUT, actionOut);
        _target.removeEventListener(MouseEvent.ROLL_OVER, actionOver);
        _target.removeEventListener(MouseEvent.MOUSE_DOWN, actionDown);
        _target.removeEventListener(MouseEvent.MOUSE_UP, actionUp);
        _target.removeEventListener(MouseEvent.CLICK, actionTouch);
    }

    protected function updateEnableState():void {
        if (_target.enabled) {
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

    private function updateFrameByState():void {
        _target.gotoAndStop(state + 1);
    }

    [cppcall]
    override public function dispatchEvent(event:Event):Boolean {
        return _target.dispatchEvent(event);
    }

    protected function actionTouch(event:Event):void {
        if (!_target.enabled) {
            event.preventDefault();
            event.stopImmediatePropagation();
            return;
        }
    }

    protected function actionUp(event:Event):void {
        if (!_target.enabled)
            return;
        state = _prevState;
    }

    protected function actionOver(event:Event):void {
        if (_target.enabled != true) {
            return;
        }
        state = STATE_OVER;
    }

    protected function actionOut(event:Event):void {
        if (!_target.enabled)
            return;
        state = STATE_NORMAL;
    }

    protected function actionDown(event:Event):void {
        if (!_target.enabled)
            return;
        _prevState = state;
        state = STATE_DOWN;
    }
}
}