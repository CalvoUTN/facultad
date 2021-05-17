#!/bin/sh

export BROWSER=wslview


echo "Class date"
read classdate

if [ -d "./images/$classdate" ]
then
echo "Directory exist"
else
`mkdir ./images/$classdate`
echo "Directory created"
fi

touch clases/$classdate.tex


if [ `grep -c "$classdate" main.tex` -ge 1 ]
then
  echo "Existing file"
else
  NEWLINE="\\\\\subfile{clases/$classdate}"
  sed -i "/% FIN/ i $NEWLINE" main.tex
fi


echo "Start YT livestream? (y/N)"
read answer

if [[ ( $answer == "y" ) ]]; then
echo "Opening YT"
xdg-open "https://studio.youtube.com/channel/UC/livestreaming"
fi

vim clases/$classdate.tex < `tty` > `tty`
