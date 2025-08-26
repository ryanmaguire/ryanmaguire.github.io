CURRENT_PATH="$(pwd)"

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
    echo "$dir"
done

rm -f index.html
rm -f feed.xml

cd "$CURRENT_PATH"
