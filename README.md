## NOTE: This currently does not work

This repo has the current status of my attempts to create a D-Gtk app (using [giD](https://github.com/Kymorphia/gid)) that runs on Android. As of now there are still unresolved issues.


## Prepare

* Look at https://github.com/sp1ritCS/gtk-android-builder for the background information and install pixiewood.
* Set up Android Studio and the SDK (Recommended Platform 31) and the NDK (Recommended Version 29).
* Prepare [LCD2 for Android](https://wiki.dlang.org/Build_D_for_Android)* (also see ldc2.conf.ex)
* Have Meson installed in a way that allows you to edit parts of it to "patch" Meson (see below).
* Make sure to use the main branch of giD.

*I highly recommend using https://dlang.org/install.html to install LCD2, as the compiler version must fit the downloaded aarch64 library perfectly. The binaries provided in the Linux distribution repositories are not close enough, even if they have the same version number.

## Build with

```
$ dub build --deep --arch=aarch64-none-linux-android --compiler=/usr/bin/ldc2 --build=debug gid:gtk4

$ ANDROID_HOME=ANDROIDSDK STUDIO_DIR=ANDROIDSTUDIO pixiewood prepare -s ANDROIDSDK -a ANDROIDSTUDIO pix.xml # Set ANDROIDSDK and ANDROIDSTUDIO to the correct paths.

$ pixiewood generate

$ pixiewood build

```

After a successful build, you should find the resulting APKs in `.pixiewood/android/app/build/outputs/apk/debug/`.

## Meson patch

For this to work Meson needs an addition. Add the following in `mesonbuild/compilers/d.py` below the `get_pic_args` function

```
def get_pie_args(self):
    return ['--relocation-model=pic']

def get_pie_link_args(self):
    return ['-L-pie']
```

And least but not last the "weirdest" thing: In `mesonbuild/dependencies/dub.py` replace alle usages of `dub_arch` with the target from the ldc2. Havent found a better way yet.

## Current Issues

* Segmentation Fault at startup
