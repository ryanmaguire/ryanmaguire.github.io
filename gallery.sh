url="https://github.com"
par="/ryanmaguire/Mathematics-and-Physics/blob/master/asymptote/"
top="$(pwd)"
out="$top/asymptote.markdown"

cd assets/asymptote/

for file in *.pdf; do
    filename="${file%.*}"
    convert -flatten -density 300 "$filename".pdf -resize 512 "$filename".png
    echo -e "**${filename//_/ }**\n" >> "$out"
    echo -e "![$filename]({{ site.url }}/assets/$filename.png)\n" >> "$out"
    echo -e "[**Source Code**]($url$par$filename.asy\n" >> "$out"
    rm -f "$file"
done