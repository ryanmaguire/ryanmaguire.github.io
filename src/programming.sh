getLanguageName() {
  case "$1" in
    c) echo "C" ;;
    c3) echo "C3" ;;
    cs) echo "C#" ;;
    cpp) echo "C++" ;;
    d) echo "D" ;;
    f90) echo "Fortran" ;;
    go) echo "Go" ;;
    java) echo "Java" ;;
    jl) echo "Julia" ;;
    js) echo "JavaScript" ;;
    kt) echo "Kotlin" ;;
    matlab.m) echo "MATLAB" ;;
    objc.m) echo "Objective-C" ;;
    pas) echo "Pascal" ;;
    pro) echo "IDL" ;;
    py) echo "Python" ;;
    r) echo "R" ;;
    rs) echo "Rust" ;;
    swift) echo "Swift" ;;
    ts) echo "TypeScript" ;;
    *) echo "Unknown" ;;
  esac
}


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

subDirs="$(find $source -mindepth 1 -maxdepth 1 -type d -not -name '.git')"
sortedSubDirs="$(echo "$subDirs" | sort)"

for sub in $sortedSubDirs; do
    subName="$(basename $sub)"
    subString="$(echo "$subName" | tr "_" " ")"
    subTitle=""
    subDir="$subName"
    subFile="$subDir/$subName.markdown"

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
    echo "permalink: /programming/$subDir/" >> "$subFile"
    echo "---" >> "$subFile"
    echo "" >> "$subFile"
    echo "[**Back**](../)" >> "$subFile"
    echo "" >> "$subFile"

    subSubDirs="$(find $sub -mindepth 1 -maxdepth 1 -type d)"
    sortedSubSubDirs="$(echo "$subSubDirs" | sort)"

    for subSub in $sortedSubSubDirs; do
        subSubName="$(basename $subSub)"
        subSubString="$(echo "$subSubName" | tr "_" " ")"
        subSubDir="$subDir/$subSubName"
        subSubFile="$subSubDir/$subSubName.markdown"
        subSubTitle=""

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
        echo "permalink: /programming/$subSubDir/" >> "$subSubFile"
        echo "---" >> "$subSubFile"
        echo "" >> "$subSubFile"
        echo "[**Back**](../)" >> "$subSubFile"
        echo "" >> "$subSubFile"

        subSubSubDirs="$(find $subSub -mindepth 1 -maxdepth 1 -type d)"
        sortedSubSubSubDirs="$(echo "$subSubSubDirs" | sort)"

        for subSubSub in $sortedSubSubSubDirs; do
            subSubSubName="$(basename $subSubSub)"
            subSubSubString="$(echo "$subSubSubName" | tr "_" " ")"
            subSubSubDir="$subSubDir/$subSubSubName"
            subSubSubFile="$subSubSubDir/$subSubSubName.markdown"
            subSubSubTitle=""

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
            echo "permalink: /programming/$subSubSubDir/" >> "$subSubSubFile"
            echo "---" >> "$subSubSubFile"
            echo "" >> "$subSubSubFile"
            echo "[**Back**](../)" >> "$subSubSubFile"
            echo "" >> "$subSubSubFile"

            for file in $(find $subSubSub -type f); do
                if [[ "$file" == "*objc.m*" ]]; then
                    extension="objc.m"
                elif [[ "$file" == "*matlab.m*" ]]; then
                    extension="matlab.m"
                else
                    extension="${file##*.}"
                fi
                header="$(getLanguageName "$extension")"
                sourceFile="${subSubSubFile/markdown/$extension.html}"
                touch "$sourceFile"
                pygmentize -o "$sourceFile" "$file"
                echo "## $header<br />" >> "$subSubSubFile"
                echo "{% include_relative $(basename $sourceFile) %}" >> "$subSubSubFile"
            done

        done
    done
done

cd ../
