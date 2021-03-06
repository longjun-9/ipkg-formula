summary="Play, record, convert, and stream audio and video"
homepage="https://ffmpeg.org"
url="https://ffmpeg.org/releases/ffmpeg-4.2.3.tar.xz"
sha256="9df6c90aed1337634c1fb026fb01c154c29c82a64ea71291ff2da9aacb9aad31"
dependencies="sdl2 opus libwebp libvorbis libtheora speex x264 x265 lame"

prepare() {
    sed_in_place 's/$_cc -v/$_cc --version/g' configure
}

build() {
    ./configure \
        --prefix="$DIR_INSTALL_PREFIX" \
        --sysroot="$SYSROOT" \
        --ar="$AR" \
        --as="$AS" \
        --cc="$CC" \
        --cxx="$CXX" \
        --nm="$NM" \
        --ranlib="$RANLIB" \
        --strip="$STRIP" \
        --arch="$TARGET_ARCH" \
        --target-os=darwin \
        --enable-cross-compile \
        --enable-pic \
        --enable-static \
        --disable-shared \
        --disable-debug \
        --disable-asm \
        --disable-doc \
        --disable-programs &&
    make clean &&
    make install
}
