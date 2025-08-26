CURRENT_PATH="$(pwd)"

rm -rf .jekyll-cache
cd ../site/

dirs="$(find . -mindepth 1 -maxdepth 1 -type d -not -name 'assets')"

for dir in $dirs; do
    rm -rf "$dir"
done

rm -f index.html
rm -f feed.xml

cd "$CURRENT_PATH"