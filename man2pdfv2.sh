#!/bin/bash
echo Converting manual page for $1 to pdf format in file named $1.pdf
echo Then copying file to man page directory in DropBox directory. 
man -t $1 | ps2pdf - $1_man_page.pdf

#cp /home/jason/Dropbox/
#/home/jason/Dropbox/man_pages_PDF/
mv -i $1_man_page.pdf /home/$USER/Dropbox/man_pages_PDF/

function openPDF
{ # This is about as simple as functions get.
	nohup gnome-open /home/$USER/Dropbox/man_pages_PDF/$1.pdf
} # Function declaration must precede call.

while true; do
	read -e -p "Do you wish to view the created pdf?" -i "y" yn
    #read -p "Do you wish to view the created pdf?" yn
    case $yn in
        [Yy]* ) openPDF $1_man_page; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

#12-01-2017
#have new dropbox folder location: /home/jason/Dropbox/Ubuntu Apps and Docs
#creating a version 3 of man2pdf to add this new path
