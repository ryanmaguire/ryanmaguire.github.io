. ./clean.sh
. ./threejs.sh

bundle exec jekyll build

mv _site/assets/* ../assets
rm -rf _site/assets

for dir in $(find _site/ -mindepth 1 -maxdepth 1 -type d); do
    if [ "$dir" == "assets" ]; then
        mv $dir/* ../assets/
    else
        mv $dir ../
    fi
done
