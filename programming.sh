dir="programming"
mainFile="$dir/$dir.markdown"
source="../../3rdparty/mitx_mathematics_programming_examples"

rm -rf "$programming"

mkdir -p "$dir"
touch "$mainFile"

echo "---" >> "$mainFile"
echo "layout: default" >> "$mainFile"
echo "title: Programming" >> "$mainFile"
echo "permalink: /programming/" >> "$mainFile"
echo "---" >> "$mainFile"
echo "" >> "$mainFile"
echo "[**Back**](../)" >> "$mainFile"
echo "" >> "$mainFile"

mainFile="../$mainFile"

cd "$dir"

for sub in $(find $source -mindepth 1 -maxdepth 1 -type d -not -name '.git'); do
    subName="$(basename $sub)"
    subString="$(echo "$subName" | tr "_" " ")"
    subTitle=""
    subFile="$subName/$subName.markdown"

    for word in $subString; do
        firstCharacter="$(tr '[:lower:]' '[:upper:]' <<< "${word:0:1}")"
        subTitle+="$firstCharacter${word:1} "
    done

    subTitle="${subTitle::-1}"
    echo "[**$subTitle**](./$subName)<br />" >> "$mainFile"

    mkdir -p "$subName"
    touch "$subFile"

    echo "---" >> "$subFile"
    echo "layout: default" >> "$subFile"
    echo "permalink: /programming/$subName/" >> "$subFile"
    echo "---" >> "$subFile"
    echo "" >> "$subFile"
    echo "[**Back**](../)" >> "$subFile"
    echo "" >> "$subFile"

    for subSub in $(find $sub -mindepth 1 -maxdepth 1 -type d); do
        subSubName="$(basename $subSub)"
        subSubString="$(echo "$subSubName" | tr "_" " ")"
        subSubTitle=""
        subSubFile="$subName/$subSubName/$subSubName.markdown"

        for word in $subSubString; do
            firstCharacter="$(tr '[:lower:]' '[:upper:]' <<< "${word:0:1}")"
            subSubTitle+="$firstCharacter${word:1} "
        done

        subSubTitle="${subSubTitle::-1}"
        echo "[**$subSubTitle**](./$subSubName)<br />" >> "$subFile"

        mkdir -p "$subName/$subSubName"
        touch "$subSubFile"

        echo "---" >> "$subSubFile"
        echo "layout: default" >> "$subSubFile"
        echo "permalink: /programming/$subName/$subSubName" >> "$subSubFile"
        echo "---" >> "$subSubFile"
        echo "" >> "$subSubFile"
        echo "[**Back**](../)" >> "$subSubFile"
        echo "" >> "$subSubFile"

        for subSubSub in $(find $subSub -mindepth 1 -maxdepth 1 -type d); do
            subSubSubName="$(basename $subSubSub)"
            subSubSubString="$(echo "$subSubSubName" | tr "_" " ")"
            subSubSubTitle=""
            subSubSubFile="$subName/$subSubName/$subSubSubName/$subSubSubName.markdown"

            for word in $subSubSubString; do
                firstCharacter="$(tr '[:lower:]' '[:upper:]' <<< "${word:0:1}")"
                subSubSubTitle+="$firstCharacter${word:1} "
            done

            subSubSubTitle="${subSubSubTitle::-1}"
            echo "[**$subSubSubTitle**](./$subSubSubName)<br />" >> "$subSubFile"

            mkdir -p "$subName/$subSubName/$subSubSubName"
            touch "$subSubFile"

            echo "---" >> "$subSubSubFile"
            echo "layout: default" >> "$subSubSubFile"
            echo "permalink: /programming/$subName/$subSubName/$subSubSubName" >> "$subSubSubFile"
            echo "---" >> "$subSubSubFile"
            echo "" >> "$subSubSubFile"
            echo "[**Back**](../)" >> "$subSubSubFile"
            echo "" >> "$subSubSubFile"

            for file in $(find $subSubSub -type f); do
                extension="${file##*.}"
                sourceFile="${subSubSubFile/markdown/$extension.html}"
                touch "$sourceFile"
                pygmentize -o "$sourceFile" "$file"
                echo "## ${extension^}<br />" >> "$subSubSubFile"
                echo "{% include_relative $(basename $sourceFile) %}" >> "$subSubSubFile"
            done

        done
    done
done

cd ../
