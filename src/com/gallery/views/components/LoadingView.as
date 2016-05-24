/**
 * Created by YuriZkit-Adm on 5/22/2016.
 */
package com.gallery.views.components {
import base.BaseView;

import flash.text.TextField;

public class LoadingView extends BaseView {
    public function LoadingView() {
        super();
    }

    override public function createChildren():void {
        super.createChildren();
        var textField:TextField = new TextField();
        textField.htmlText = "LOADING";
        addChild(textField);
    }
}
}
