#!/bin/bash
cd "$(dirname "$0")/.."

BLEND_BASE="./lfs/blend"
GLTF_BASE="./cache/gltf"

try_all() {
    for f in $BLEND_BASE/**.blend; do
        ./scripts/blender_export_gltf.sh "$f" "$BLEND_BASE" "$GLTF_BASE" true
    done
}

try_all

while true; do
    sleep 1;
    ls -d $BLEND_BASE/**.blend | entr -p -d ./scripts/blender_export_gltf.sh /_ "$BLEND_BASE" "$GLTF_BASE"
    try_all
done

