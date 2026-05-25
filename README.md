## NOTE: This currently does not work

## Prepare

Look at https://github.com/sp1ritCS/gtk-android-builder for the background.

Setup Android Studio (or pure SDK) and prepare [lcd2 for android](https://wiki.dlang.org/Build_D_for_Android).

Replace `ANDROIDSDK` and `LCD2LIB` (see http://github.com/ldc-developers/ldc/releases/) in all the files with the according pathes.

## Build with
``
ANDROID_HOME=ANDROID-SDK STUDIO_DIR=ANDROID-STUDIO pixiewood prepare -s ANDROID-SDK -a ANDROID-STUDIO pix.xml 
``

``
ANDROID_HOME=ANDROID-SDK STUDIO_DIR=ANDROID-STUDIO pixiewood generate
``

``
ANDROID_HOME=ANDROID-SDK STUDIO_DIR=ANDROID-STUDIO pixiewood build
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

## Issues while linking

Try the build steps and then (basicly force the correct toolset to be used):


```
 export CC=ANDROIDSDK/Sdk/ndk/30.0.14904198/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android31-clang
 export CXX=$CC++
 export AR=ANDROIDSDK/Sdk/ndk/30.0.14904198/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-ar
 export LD=$CC

```

After that run the last step again.
