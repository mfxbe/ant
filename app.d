import gio.types : ApplicationFlags;
import gtk.application;
import gtk.application_window;
import gtk.label;

class ExampleApp:Application{
        this() {
                super("de.mfxbe.GiDAndroidApp", ApplicationFlags.DefaultFlags);
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

void main(string[] args) {
        auto app = new ExampleApp;
        app.run(args);
}
