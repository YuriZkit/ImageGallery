/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer.services {
public interface IFileLoaderService {
    function loadFile(path:String):void
    function loadFileList(list:Array):void
    function browse():void;
}
}
