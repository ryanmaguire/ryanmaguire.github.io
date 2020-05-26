rm -f asymptote.markdown
touch asymptote.markdown

url="https://github.com"
par="/ryanmaguire/Mathematics-and-Physics/blob/master/asymptote/"
top="$(pwd)"
out="$top/asymptote.markdown"

echo -e "---" >> "$out"
echo -e "layout: default" >> "$out"
echo -e "title: Asymptote" >> "$out"
echo -e "permalink: /asymptote/" >> "$out"
echo -e "---\n" >> "$out"
echo -e "[**Back**](../)\n" >> "$out"

cd assets/asymptote/

for file in *; do
    filename="${file%.*}"
    if [ "${file##*.}" == ".pdf" ]; then
        convert -flatten -density 300 "$file" -resize 512 "$filename".png
        rm -f "$file"
    fi
    echo -e "**${filename//_/ }**\n" >> "$out"
    echo -e "![$filename]({{ site.url }}/assets/asymptote/$filename.png)\n" >> "$out"
    echo -e "[**Source Code**]($url$par$filename.asy)\n" >> "$out"
done