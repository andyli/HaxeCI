import Sys.*;
import sys.io.File.*;
import haxe.*;
using StringTools;

/**
    Test a JS file in PhantomJS.
*/
class Run {
    static var phantomjsRunner(default, never) = "phantomjs/phantomjs.js";
    static var phantomjsHtml(default, never) = "phantomjs/phantomjs.html";
    static function main() {
        var args = args();
        var jsFile = args[0];     // The compiled js file, relative to "bin".
        var successMsg = args[1]; // A trace/console success message to look for. (optional)

        var tmpl = new Template(getContent(phantomjsHtml));
        var html = tmpl.execute({
        	jsFile: jsFile
        });
        saveContent("bin/phantomjs.html", html);

        var exitCode = command(
        	"phantomjs",
        	if (successMsg == null)
        		[phantomjsRunner]
        	else
        		[phantomjsRunner, successMsg]
        );
        exit(exitCode);
    }
}