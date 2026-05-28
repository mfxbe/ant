project('ant', 'd', meson_version: '>=1.9.0')

gid_dep = dependency('gid:gtk4', method: 'dub')

dependency('gtk4')

exe = executable('giDAndroidApp', ['app.d'], dependencies: [
 gid_dep        
], android_exe_type: 'application', install: true, link_args: ['-link-defaultlib-shared=false', '-mtriple=aarch64-none-linux-android', '-llog', '-landroid'])
