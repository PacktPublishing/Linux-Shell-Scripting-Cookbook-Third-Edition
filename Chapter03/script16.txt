$> cat makePan.sh

# Invoke as: sh makePan.sh OriginalImage.jpg prefix width height xoffset yoffset

# Clean out any old data

rm -f tmpFiles

# Create 200 still images, stepping through the original xoffset and yoffset

# pixels at a time

for o in `seq 1 200`

do

x=$[ $o+$5 ]

convert -extract $3x$4+$x+$6 $1 $2_$x.jpg
echo $2_$x.jpg
 >> tmpFiles
done

#Stitch together the image files into a mpg video file

mencoder mf://@tmpFiles -mf fps=30 -ovc lavc -lavcopts \

vcodec=msmpeg4v2 -noskip -o $2.mpg
