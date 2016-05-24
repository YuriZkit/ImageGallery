/**
 * Created by YuriZkit-Adm on 5/22/2016.
 */
package viewer.views.components {
import base.BaseView;

import flash.text.TextField;

public class WelcomeView extends BaseView {
    private var textField:TextField;
    public function WelcomeView() {
        super();
    }

    override public function createChildren():void {
        super.createChildren();
        textField = new TextField();
        textField.htmlText = "Hello Test";
        addChild(textField);
    }
}
}
