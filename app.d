import std.stdio;
import std.array;

import gio.types : ApplicationFlags;
import gtk.application;
import gtk.application_window;
import gtk.label;

class ExampleApp:Application{
	this() {
		super("de.mfxbe.ExampleApp", ApplicationFlags.DefaultFlags);
		connectActivate(&onActivate);
	}

	void onActivate(){
		auto window = new ApplicationWindow(this);
		window.setDefaultSize(200, 200);
		auto label = new Label("Hello World");
		window.setChild(label);

		window.present();
	}
}

//void main(string[] args) {
//	auto app = new ExampleApp;
//	app.run(args);
//}

extern(C) int main(int argc, char** argv){
	import gio.c.functions;
	import gio.c.types;

	ExampleApp app = new ExampleApp;
	return g_application_run(cast(GApplication*) app._cPtr, argc, argv);
}
