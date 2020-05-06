#!/bin/bash

# Written by jason Procknw

#logging events
logger -p user.info "man2pdfv4.sh script started"
echo man2pdfv4.sh script started
echo Converting manual page for $1 to pdf format in a file named $1_man_page.pdf
echo Then copying file to man page directory in DropBox directory.
man -t $1 | ps2pdf - $1_man_page.pdf

pdfbook2 $1_man_page.pdf


#new as of 04-23-2020
#/home/jason/Dropbox/man_pages_PDF/Ubuntu_Apps_and_Docs
#/home/jason/Dropbox/Ubuntu_Apps_and_Docs/man_pages_PDF/
mv -i $1_man_page.pdf "/home/jason/Dropbox/Ubuntu_Apps_and_Docs/man_pages_PDF/"
mv -i $1_man_page-book.pdf "/home/jason/Dropbox/Ubuntu_Apps_and_Docs/man_pages_PDF/"
echo "PDF page and book has been created and is now saved at /home/jason/Dropbox/Ubuntu_Apps_and_Docs/man_pages_PDF/$1_man_page.pdf and $1_man_page-book.pdf"
logger -p user.info "PDF file saved at /home/jason/Dropbox/Ubuntu_Apps_and_Docs/man_pages_PDF/$1_man_page.pdf"

#mv -i $1_man_page.pdf "/home/jason/Dropbox/Ubuntu Apps and Docs/man_pages_PDF/"
#echo "PDF file saved at /home/jason/Dropbox/Ubuntu Apps and Docs/man_pages_PDF/$1_man_page.pdf"
#logger -p user.info "PDF file saved at /home/jason/Dropbox/Ubuntu Apps and Docs/man_pages_PDF/$1_man_page.pdf"




function openPDF
{ # This is about as simple as functions get.
	echo googlechromestart
    nohup google-chrome "//home/jason/Dropbox/Ubuntu_Apps_and_Docs/man_pages_PDF/$1.pdf"
} # Function declaration must precede call.


function openPDFbook
{ # This is about as simple as functions get.
	echo googlechromestart
    nohup google-chrome "//home/jason/Dropbox/Ubuntu_Apps_and_Docs/man_pages_PDF/$1-book.pdf"
} # Function declaration must precede call.

# This while do will ask if there should be a booklet formattted pdf created as
# well as the normal formattted coppy.  The booklet  copy will ne named same
# but with book at the end of file name.
#			For example: a man page about the exif command would be turned into some
# different types of pdf file formats.


# This question asks if you want to see the man that is now a pdf. m


while true; do
    read -e -p "Do you wish to view the created pdf?" -i "y" yn
    #read -p "Do you wish to view the created pdf?" yn
    case $yn in
        [Yy]* ) openPDF $1_man_page; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo done
logger -p user.info "man2pdfv4.sh script ended"


while true; do
    read -e -p "Do you wish to view the created pdf booklet?" -i "y" yn
    #read -p "Do you wish to view the created pdf?" yn
    case $yn in
        [Yy]* ) openPDF $1_man_page; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo done
logger -p user.info "man2pdfv4.sh script ended"
#12-01-2017
#have new dropbox folder location: /home/jason/Dropbox/Ubuntu Apps and Docs
#creating a version 3 of man2pdf to add this new path