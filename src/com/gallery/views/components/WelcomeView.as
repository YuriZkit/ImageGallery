/**
 * Created by YuriZkit-Adm on 5/22/2016.
 */
package com.gallery.views.components {
import base.BaseView;

import flash.text.TextField;

public class WelcomeView extends BaseView {
    public function WelcomeView() {
        super();
    }
    private var textField:TextField;

    override public function createChildren():void {
        super.createChildren();
        textField = new TextField();
        textField.htmlText = "Hello Test";
        addChild(textField);
    }
}
}
