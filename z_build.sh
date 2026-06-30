#!/bin/bash

set -e

OS="$(uname -s)"

# ---------------------------
# FLAGS PADRÃO
# ---------------------------

if [[ "$OS" == "Linux" ]]; then
    CURL_FLAGS=$(pkg-config --cflags --libs libcurl 2>/dev/null || echo "")
    RAYLIB_FLAGS=$(pkg-config --cflags --libs raylib 2>/dev/null || echo "-lraylib -lGL -lm -lpthread -ldl -lrt -lX11")

    CC=gcc
    EXE="./build/game"

elif [[ "$OS" == MINGW* || "$OS" == "MSYS"* ]]; then
    echo "Detected Windows (MSYS/MinGW)"

    CURL_FLAGS="-lcurl"
    RAYLIB_FLAGS="-lraylib -lopengl32 -lgdi32 -lwinmm"

    CC=x86_64-w64-mingw32-gcc
    EXE="build/game.exe"

else
    echo "OS not supported"
    exit 1
fi

# ---------------------------
# MODOS
# ---------------------------

case "$1" in
  release)
    echo "Building RELEASE"
    $CC -O3 -march=native -s game.c $RAYLIB_FLAGS $CURL_FLAGS -o $EXE
    $EXE
    ;;

  debug|"")
    echo "Building DEBUG"
    $CC -g -O0 -Wall game.c $RAYLIB_FLAGS $CURL_FLAGS -o $EXE
    $EXE
    ;;

  wasm)
    echo "Building WASM"
    emcc game.c web_game.c -O3 -DWASM \
        -s USE_GLFW=3 \
        -s TOTAL_MEMORY=1073741824 \
        -s FORCE_FILESYSTEM=1 \
        -s MAX_WEBGL_VERSION=2 \
        -s USE_WEBGL2=1 \
        -s FETCH=1 \
        --preload-file assets \
        -s ASYNCIFY \
        -o build/wasm/game.html
    ;;
esac