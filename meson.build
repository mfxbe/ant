project('ant', 'd', meson_version: '>=1.9.0')

add_global_arguments('-relocation-model=pic', language : 'd')
add_global_arguments('-L=-pie', language : 'd')

dub_exe = find_program('dub', required : false)
run_command('dub', 'run', 'dub-build-deep', '--yes', '--', 'gid:gtk4', '--compiler', 'ldc2', check: true)

gid_dep = dependency('gid:gtk4', method: 'dub')

dependency('gtk4')

exe = executable('ant', ['app.d'], dependencies: [
	gid_dep
], android_exe_type: 'application', install: true, link_args: ['-link-defaultlib-shared=false'])
