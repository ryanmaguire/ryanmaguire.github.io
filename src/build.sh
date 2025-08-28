CURRENT_PATH="$(pwd)"

. ./clean.sh
. ./programming.sh
. ./threejs.sh

bundle exec jekyll build

cd ../
cp site/assets/* assets/
cp site/threejs/* threejs/
rm -rf site/assets
rm -rf site/threejs
mv site/* .
rm -rf site

cd "$CURRENT_PATH"
rm -rf programming
rm -rf .jekyll-cache
