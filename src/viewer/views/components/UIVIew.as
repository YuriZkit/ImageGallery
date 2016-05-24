/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer.views.components {
import assets.basebutton;

import base.BaseView;
import base.ui.ButtonView;

import fl.controls.Slider;
import fl.events.SliderEvent;

import flash.display.Shape;
import flash.events.MouseEvent;

import org.osflash.signals.Signal;

import viewer.models.StateConfig;

import viewer.models.ViewerModel;

public class UIVIew extends BaseView {

    private var _browseBtn:ButtonView;
    private var _selectBtn:ButtonView;
    private var _browseMC:basebutton;
    private var _selectMC:basebutton;
    private var _horizontalLine:Shape;
    private var _sliderMC:Slider;
    public var browseSignal:Signal;
    public var imageSizeChange:Signal;
    private var _hudWidth:int = 0;
    public function UIVIew() {
        browseSignal = new Signal();
        imageSizeChange = new Signal();
        name = "uiView";
        super();
    }

    override public function createChildren():void {
        _browseMC = new basebutton();
        _selectMC = new basebutton();
        _browseMC.txt.text = "ADD";
        _selectMC.txt.text = "SELECT";

        _selectMC.y = 2;
        _browseMC.y = 2;

        _browseBtn = new ButtonView(_browseMC);
        _selectBtn = new ButtonView(_selectMC);
        _browseBtn.addEventListener(MouseEvent.CLICK, onBrowseClick);
        _selectBtn.addEventListener(MouseEvent.CLICK, onSelectClick);
        _horizontalLine = new Shape();

        _browseMC.x = 5;
        _selectMC.x = _browseMC.x + _browseMC.width + 5;

        _sliderMC = new Slider();
        _sliderMC.maximum = 4;
        _sliderMC.tickInterval = 1;
        _sliderMC.value = 2;
        _sliderMC.setSize(150,5);
        _sliderMC.addEventListener(SliderEvent.CHANGE, onSliderChanged);
        drawHorizontalLine();
        addChild(_browseMC);
        addChild(_horizontalLine);
        addChild(_sliderMC);
        addChild(_selectMC);
        super.createChildren();
    }

    public function updateButtonsState(state:String):void {
        _sliderMC.enabled = _selectBtn.enabled = (state == StateConfig.GALLERY_STATE);
        _browseMC.enabled = (state != StateConfig.LOADING_STATE);
    }

    private function onSelectClick(event:MouseEvent):void {

    }

    private function onSliderChanged(event:SliderEvent):void {
        imageSizeChange.dispatch(event.value);
    }

    override public function resize(width:Number, height:Number):void {
        super.resize(width, height);
        _hudWidth = width;
        drawHorizontalLine();
        _sliderMC.y = _horizontalLine.y/2 - _sliderMC.height;
        _sliderMC.x = _hudWidth - _sliderMC.width - 50;
    }

    private function drawHorizontalLine():void {
        _horizontalLine.graphics.clear();
        _horizontalLine.graphics.lineStyle(4,0xF4F4F4);
        _horizontalLine.graphics.lineTo(_hudWidth, 0);
        _horizontalLine.y = _browseMC.height + 4;
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
