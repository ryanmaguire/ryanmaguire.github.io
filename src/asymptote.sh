rm -rf asymptote
mkdir -p asymptote

projdir=$HOME/Documents/Code
parent=$projdir/Mathematics-and-Physics/
sitename=https://ryanmaguire.github.io
sitehome=$projdir/ryanmaguire.github.io/
webpage=${sitehome}asymptote/asymptote.markdown
touch $webpage

echo "---" >> $webpage
echo "layout: default" >> $webpage
echo "title: Asymptote" >> $webpage
echo "permalink: /asymptote/" >> $webpage
echo "---" >> $webpage
echo "" >> $webpage
echo "[**Back**](../)" >> $webpage
echo "" >> $webpage

for directory in ${parent}asymptote/*; do

    # Check if this is actually a directory.
    if [ -d "$directory" ]; then

        # Extract the last part of the path.
        localdir=${directory#$parent}

        # Create this directory within the website.
        mkdir -p ./$localdir

        # Create a markdown page for the subdirectory.
        localdirbasename=$(basename $localdir)
        localdirmarkdown=$localdir/$localdirbasename.markdown
        touch $localdirmarkdown

        echo "---" >> $localdirmarkdown
        echo "layout: default" >> $localdirmarkdown
        echo "permalink: /$localdir/" >> $localdirmarkdown
        echo "---" >> $localdirmarkdown
        echo "" >> $localdirmarkdown
        echo "[**Back**](../)" >> $localdirmarkdown
        echo "" >> $localdirmarkdown
        
        echo -e "[**$localdirbasename**](./$localdirbasename)\n" >> $webpage

        # Loop through the subdirectories and create the figures.
        for subdirectory in $directory/*; do

            # Check that this is indeed a subdirectory.
            if [ -d "$subdirectory" ]; then

                # Extract the last part of the path.
                localsubdir=${subdirectory#$parent}

                # Create the subdirectory for the website.
                mkdir -p ./$localsubdir

                # Create a markdown page for the website.
                localsubdirbasename=$(basename $localsubdir)
                localsubdirmarkdown=$localsubdir/$localsubdirbasename.markdown
                touch $localsubdirmarkdown

                echo "---" >> $localsubdirmarkdown
                echo "layout: default" >> $localsubdirmarkdown
                echo "permalink: /$localsubdir/" >> $localsubdirmarkdown
                echo "---" >> $localsubdirmarkdown
                echo "" >> $localsubdirmarkdown
                echo -e "[**Back**](../)\n" >> $localsubdirmarkdown
                echo "" >> $localsubdirmarkdown

                echo -e "[**$localsubdirbasename**](./$localsubdirbasename)\n" >> $localdirmarkdown

                # Change directory into the subdirectory and generate figures.
                for file in $subdirectory/*.asy; do
                    filename="$(basename $file)"
                    filenamenoext="${filename%.*}"

                    asy $file
                    if [ -e "$filenamenoext.eps" ]; then
                        convert $filenamenoext.eps $filenamenoext.pdf
                        rm -f $filenamenoext.eps
                    fi

                    if [ -e "$filenamenoext.pdf" ]; then
                        mv $filenamenoext.pdf ./assets/
                        echo -e "[$filenamenoext]($sitename/assets/$filenamenoext.pdf)\n" >> $localsubdirmarkdown
                    else
                        mv $filenamenoext.gif ./assets/
                        echo -e "[$filenamenoext]($sitename/assets/$filenamenoext.gif)\n" >> $localsubdirmarkdown
                    fi  
                done
            fi
        done
    fi
done
