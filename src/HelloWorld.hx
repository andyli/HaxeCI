class HelloWorld {
	static function main():Void {
		trace("Hello world!");

		#if flash
		flash.system.System.exit(0);
		#end
	}
}