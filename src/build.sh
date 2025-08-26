CURRENT_PATH="$(pwd)"

. ./clean.sh
. ./threejs.sh

bundle exec jekyll build

cd ../
cp site/assets/* assets/
rm -rf site/assets
mv site/* .
rm -rf site
