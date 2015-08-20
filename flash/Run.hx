import Sys.*;
import sys.FileSystem.*;

class Run {
	static function main() {
		var args = args();
		var swf = fullPath(args[0]);
		var exitCode = switch (systemName()) {
			case "Linux":
				command("flash/flashplayerdebugger", [swf]);
			case "Mac":
				command("flash/Flash Player Debugger.app/Contents/MacOS/Flash Player Debugger", [swf]);
			case _:
				throw "unsupported platform";
		}
		exit(exitCode);
	}
}