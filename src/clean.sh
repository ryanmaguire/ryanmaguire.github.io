CURRENT_PATH="$(pwd)"
rm -rf _site
rm -rf .jekyll-cache

cd ../

dirs="$(\
    find . \
        -mindepth 1 \
        -maxdepth 1 \
        -type d \
        -not -name 'src'        \
        -not -name 'assets'     \
        -not -name '3rdparty'   \
        -not -name '.git'       \
)"

for dir in $dirs; do
    rm -rf "$dir"
done

rm -f index.html
rm -f feed.xml

cd "$CURRENT_PATH"