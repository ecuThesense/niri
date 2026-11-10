# as your normal user, no doas
meson configure build -Dfcft:werror=false
ninja -C build

# install only, no rebuild step
doas meson install -C build --no-rebuild

mkdir -p bld/release && cd bld/release
export CFLAGS="$CFLAGS -O3"
meson --buildtype=release --prefix=/usr -Db_lto=true ../..
ninja
ninja test
ninja install
