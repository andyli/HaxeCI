import Sys.*;
import sys.FileSystem.*;
import sys.io.File.*;
import haxe.io.*;

class Install {
	static var fpDownload(default, never) = "http://fpdownload.macromedia.com/pub/flashplayer/updaters/11/flashplayer_11_sa_debug.i386.tar.gz";
	static var mmcfgPath(default, never) = switch (systemName()) {
		case "Linux":
			Path.join([getEnv("HOME"), "mm.cfg"]);
		case "Mac":
			Path.join([getEnv("HOME"), "Library/Application Support/Macromedia/mm.cfg"]);
		case "Windows":
			Path.join([getEnv("SYSTEMROOT"), "system32", "Macromed", "Flash", "mm.cfg"]);
		case _:
			throw "unsupported system";
	}
	static var fpTrust(default, never) = switch (systemName()) {
		case "Linux":
			Path.join([getEnv("HOME"), ".macromedia/Flash_Player/#Security/FlashPlayerTrust"]);
		case "Mac":
			Path.join([getEnv("HOME"), "Library/Application Support/Macromedia/FlashPlayerTrust"]);
		case "Windows":
			Path.join([getEnv("SYSTEMROOT"), "system32", "Macromed", "Flash", "FlashPlayerTrust"]);
		case _:
			throw "unsupported system";
	}
	static function main() {
		switch (systemName()) {
			case "Linux":
				if (getEnv("TRAVIS") == "true") {
					// xvfb
					putEnv("DISPLAY", ":99.0");
					putEnv("AUDIODEV", "null");
					if (command("sh", ["-e", "/etc/init.d/xvfb", "start"]) != 0)
						throw "failed to start xvfb";
				}

				// Download and unzip the flash player
				if (command("wget", [fpDownload]) != 0)
					throw "failed to download flash player";
				if (command("tar", ["-xf", new Path(fpDownload).file, "-C", "flash"]) != 0)
					throw "failed to extract flash player";
			case "Mac":
				if (command("brew", ["install", "caskroom/cask/brew-cask"]) != 0)
					throw "failed to brew install caskroom/cask/brew-cask";
				if (command("brew", ["cask", "install", "flash-player-debugger", "--appdir=flash"]) != 0)
					throw "failed to install flash-player-debugger";
		}
		

		// Create a configuration file so the trace log is enabled
		saveContent(mmcfgPath, "ErrorReportingEnable=1\nTraceOutputFileEnable=1");

		// Add the current directory as trusted, so exit() can be used
		createDirectory(fpTrust);
		saveContent(Path.join([fpTrust, "test.cfg"]), getCwd());
	}
}