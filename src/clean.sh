CURRENT_PATH="$(pwd)"

rm -f threejs.markdown
rm -rf .jekyll-cache
cd ../

dirs="$(                    \
    find .                  \
    -mindepth 1             \
    -maxdepth 1             \
    -type d                 \
    -not -name 'assets'     \
    -not -name '3rdparty'   \
    -not -name 'src'        \
    -not -name '.git'       \
)"

for dir in $dirs; do
    rm -rf "$dir"
done

rm -f index.html
rm -f feed.xml

cd "$CURRENT_PATH"
