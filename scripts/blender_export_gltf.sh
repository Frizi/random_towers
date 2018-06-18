BLENDER="/Applications/blender-2.79-rc1/blender.app/Contents/MacOS/blender"

relpath() {
    python -c "import os.path; print os.path.relpath('$1','${2:-$PWD}')" ;
}

export_blend() {
    filename=$1
    basepath=$2
    destpath=$3
    ignore_if_exists=$4

    reldir=$(relpath "${filename%.*}" "$basepath")
    outfile="$destpath/$reldir.gltf"

    if [ "$ignore_if_exists" = "true" -a -e "$outfile" ]; then
        echo "exists: $outfile"
        return
    fi
    echo "$filename -> $outfile"
    export BLENDER_EXPORTER_OUTPUT_FILE="$outfile"
    ${BLENDER} -b "${filename}" -P "scripts/export_gltf.py"
}

export_blend $@
