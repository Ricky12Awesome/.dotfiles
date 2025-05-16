#!/usr/bin/env bash
# https://handbrake.fr/docs/en/latest/developer/build-linux.html


# if command -v rustup &>/dev/null; then
#     [[ ! $(rustup default &>/dev/null) ]] && rustup default stable
# else
#     echo "Install rust first"
#     exit
# fi

# cargo install cbuild

# Install repos (I use fedora based distros)
#sudo dnf install autoconf automake binutils bzip2-devel cmake fontconfig-devel freetype-devel fribidi-devel gcc-c++ git harfbuzz-devel jansson-devel lame-devel lbzip2 libass-devel libogg-devel libsamplerate-devel libtheora-devel libtool libvorbis-devel libxml2-devel libvpx-devel m4 make meson nasm ninja-build numactl-devel opus-devel patch pkgconf python speex-devel tar turbojpeg-devel xz-devel zlib-devel libva-devel libdrm-devel desktop-file-utils gstreamer1-libav gstreamer1-plugins-base-devel gstreamer1-plugins-good gtk4-devel clang-devel x264-devel cuda-devel

version=$(curl -s https://api.github.com/repos/HandBrake/HandBrake/releases/latest | jq -r ".tag_name")

if [[ ! -e "/tmp/HandBrake" ]]; then
    git clone https://github.com/HandBrake/HandBrake /tmp/HandBrake
fi

cd /tmp/HandBrake || exit
git fetch
git pull
git checkout "$version"

args=(
 --enable-gtk          # enable GTK GUI
#--disable-gtk         # disable GTK GUI
 --enable-x265         # enable x265 video encoder
#--disable-x265        # disable x265 video encoder
#--enable-numa         # enable x265 NUMA support
 --disable-numa        # disable x265 NUMA support
#--enable-fdk-aac      # enable FDK AAC audio encoder
 --disable-fdk-aac     # disable FDK AAC audio encoder
 --enable-nvenc        # enable Nvidia NVENC video encoder
#--disable-nvenc       # disable Nvidia NVENC video encoder
 --enable-nvdec        # enable Nvidia NVDEC video decoder
#--disable-nvdec       # disable Nvidia NVDEC video decoder
#--enable-qsv          # enable Intel QSV video encoder/decoder
 --disable-qsv         # disable Intel QSV video encoder/decoder
#--enable-vce          # enable AMD VCE video encoder
#--disable-vce         # disable AMD VCE video encoder
#--enable-libdovi      # enable libdovi
 --disable-libdovi     # disable libdovi
)

./configure --launch-jobs="$(nproc)" --force "${args[@]}"
cd build || exit

make
sudo make install


