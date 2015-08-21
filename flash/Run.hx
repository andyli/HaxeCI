import Sys.*;
import sys.FileSystem.*;
import sys.io.File.*;
import haxe.io.*;

class Run {
	static var flashlog(default, never) = switch (systemName()) {
		case "Linux":
			Path.join([getEnv("HOME"), ".macromedia/Flash_Player/Logs/flashlog.txt"]);
		case "Mac":
			Path.join([getEnv("HOME"), "Library/Preferences/Macromedia/Flash Player/Logs/flashlog.txt"]);
		case "Windows":
			Path.join([getEnv("APPDATA"), "Macromedia", "Flash Player", "Logs", "flashlog.txt"]);
		case _:
			throw "unsupported system";
	}
	static function main() {
		var args = args();
		var swf = args[0];
		var exitCode = switch (systemName()) {
			case "Linux":
				command("xvfb-run", ["flash/flashplayerdebugger", swf]);
			case "Mac":
				command("flash/Flash Player Debugger.app/Contents/MacOS/Flash Player Debugger", [fullPath(swf)]);
			case "Windows":
				command("flash/flashplayer.exe", [fullPath(swf)]);
			case _:
				throw "unsupported platform";
		}
		println(getContent(flashlog));
		exit(exitCode);
	}
}