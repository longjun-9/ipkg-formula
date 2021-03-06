summary="Vorbis General Audio Compression Codec"
homepage="https://xiph.org/vorbis"
url="https://downloads.xiph.org/releases/vorbis/libvorbis-1.3.6.tar.xz"
sha256="af00bb5a784e7c9e69f56823de4637c350643deedaf333d0fa86ecdba6fcb415"
dependencies="libogg"

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-sysroot="$SYSROOT" \
        --with-ogg="$libogg_DIR_INSTALL_PREFIX" \
        --disable-shared \
        --enable-static \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CPP="$CPP" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" &&
    make clean &&
    make install
}

build2() {
    cmake \
    -DOGG_INCLUDE_DIRS="$libogg_DIR_INCLUDE" \
    -DOGG_LIBRARIES="$libogg_DIR_LIB/libogg.a"
}
