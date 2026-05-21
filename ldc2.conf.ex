//The LDC2 config must be prepaired for android cross compiling see https://wiki.dlang.org/Build_D_for_Android
//Append to the file:

"aarch64-.*-linux-android31":
{
    switches = [
        "-defaultlib=phobos2-ldc,druntime-ldc",
        "-gcc=ANDROID/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android31-clang",
    ];
    lib-dirs = [
        "ANDROID/lib-android_aarch64",
    ];
};
