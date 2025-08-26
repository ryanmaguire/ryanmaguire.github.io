CURRENT_PATH="$(pwd)"
SOURCE_PATH="../../../3rdparty/threejs_figures/"
mkdir -p _site/threejs/
cd _site/threejs/

find . -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} \;

files=$(find "$SOURCE_PATH" \( -name "*.html" -o -name "*.js" \))

for file in $files; do

    extension="${file##*.}"
    fullDirectory="$(dirname "$file")"
    directory="$(basename "$fullDirectory")"

    fullParentDirectory="$(dirname "$fullDirectory")"
    parentDirectory="$(basename "$fullParentDirectory")"

    relativePath="${parentDirectory}/${directory}"

    mkdir -p "$relativePath"

    if [ "$extension" == "html" ]; then
        cp "$file" "$relativePath/index.html"
    else
        cp "$file" "$relativePath/"
    fi

done

cd "$CURRENT_PATH"
