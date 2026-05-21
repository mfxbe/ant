## NOTE: This currently does not work

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

# Meson patch

For this to work meson needs an addition add the following in `mesonbuild/compilers/d.py` below the `get_pic_args` function

```
def get_pie_args(self):
    return ['--relocation-model=pic']

def get_pie_link_args(self):
    return ['-L-pie']
```

Also in `mesonbuild/dependencies/dub.py` the line `dub_arch = self.compiler.arch` (arround nr 124) must be replaced with `dub_arch = self.env.machines[self.for_machine].cpu_family`.
