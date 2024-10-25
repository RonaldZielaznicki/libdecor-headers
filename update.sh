#!/usr/bin/env bash
set -euo pipefail
set -x

# 0.2.2
LIBDECOR_REV=7807ae3480f5c6a37c5e8505d94af1e764aaf704

# `git clone --depth 1` but at a specific revision
git_clone_rev() {
    repo=$1
    rev=$2
    dir=$3

    rm -rf "$dir"
    mkdir "$dir"
    pushd "$dir"
    git init -q
    git fetch "$repo" "$rev" --depth 1
    git checkout -q FETCH_HEAD
    popd
}

rm -rf include
mkdir include
git_clone_rev https://gitlab.freedesktop.org/libdecor/libdecor.git "$LIBDECOR_REV" _libdecor
mv _libdecor/src/*.h include
rm -rf _libdecor
