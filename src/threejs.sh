CURRENT_PATH="$(pwd)"
SOURCE_PATH="../3rdparty/threejs_figures/"
mainFile="$CURRENT_PATH/threejs.markdown"

rm -f "$mainFile"
touch "$mainFile"

echo "---" >> "$mainFile"
echo "layout: default" >> "$mainFile"
echo "title: Three.js" >> "$mainFile"
echo "permalink: /threejs/" >> "$mainFile"
echo "---" >> "$mainFile"
echo "" >> "$mainFile"
echo "[**Back**](../)" >> "$mainFile"
echo "" >> "$mainFile"

mkdir -p ../threejs/
cd ../threejs/

find . -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} \;

dirs="$(find "$SOURCE_PATH" -mindepth 1 -maxdepth 1 -type d -not -name ".git")"
sortedDirs="$(echo "$dirs" | sort)"

for dir in $sortedDirs; do

    lowerName="$(echo $(basename "$dir") | sed 's/\([A-Z]\)/ \1/g')"
    name="${lowerName^}"

    echo "## **$name**" >> "$mainFile"

    files="$(find "$dir" -type f -name "*.js" -or -name "*.html")"
    sortedFiles="$(echo "$files" | sort)"

    for file in $sortedFiles; do

        extension="${file##*.}"
        fullDirectory="$(dirname "$file")"
        directory="$(basename "$fullDirectory")"

        fullParentDirectory="$(dirname "$fullDirectory")"
        parentDirectory="$(basename "$fullParentDirectory")"

        relativePath="${parentDirectory}/${directory}"

        mkdir -p "$relativePath"

        if [ "$extension" == "html" ]; then
            lowerFileName="$(echo "$directory" | sed 's/\([A-Z]\)/ \1/g')"
            fileName="${lowerFileName^}"

            echo "[**$fileName**](./$relativePath)<br />" >> "$mainFile"
            cp "$file" "$relativePath/index.html"
        else
            cp "$file" "$relativePath/"
        fi



    done

    echo "" >> "$mainFile"
done

cd "$CURRENT_PATH"
