## NOTE: This currently does not work

## Prepare

Look at https://github.com/sp1ritCS/gtk-android-builder for the background.

Setup Android Studio (or pure SDK) and prepare [lcd2 for android](https://wiki.dlang.org/Build_D_for_Android) (You can use [d_android](https://github.com/adamdruppe/d_android) for that).

Replace `ANDROIDSDK` and `LCD2LIB` (see http://github.com/ldc-developers/ldc/releases/) in all the files with the according pathes.

## Build with
``
dub build --deep --arch=aarch64-none-linux-android --compiler=/usr/bin/ldc2 --build=debug gid:gtk4
``

``
ANDROID_HOME=ANDROID-SDK STUDIO_DIR=ANDROID-STUDIO pixiewood prepare -s ANDROID-SDK -a ANDROID-STUDIO pix.xml 
``

``
pixiewood generate
``

``
pixiewood build
``

## Meson patch

For this to work meson needs an addition add the following in `mesonbuild/compilers/d.py` below the `get_pic_args` function

```
def get_pie_args(self):
    return ['--relocation-model=pic']

def get_pie_link_args(self):
    return ['-L-pie']
```

Also in `mesonbuild/dependencies/dub.py` the line `dub_arch = self.compiler.arch` (arround nr 124) must be replaced with `dub_arch = self.env.machines[self.for_machine].cpu_family`.
