#!/bin/bash
zenity --info --title="welcome" --text "File Management"
value=$(zenity --entry --title="Menu" --text "Options" "Create File" "Rename File" "List all files" "List a particular file" "Move a file" "Copy a file" "Create a link on Desktop" "Compare a file" "Exit")
case $value in
"Create File" )
a=$(zenity --title=File Management --entry --text="Enter file name")
touch $a
zenity --title=File management --info --text="File created:$a"
;;
"Rename File" ) 
a1=$(zenity --title=File Management --entry --text="Enter old file name")
a2=$(zenity --title=File Management --entry --text="Enter new file name")
mv $a1 $a2
zenity --title=File management --info --text="File $a1 renamed to $a2"
;;
"List all files" ) 
FILE=`zenity --file-selection --title="Select a File"`

case $? in
         0)
                echo "\"$FILE\" selected.";;
         1)
                echo "No file selected.";;
        -1)
                echo "An unexpected error has occurred.";;
esac
;;
"List a particular file" ) 
a15=$(zenity --title=File Management --entry --text="Enter file name")
gedit $a15
	

;;
"Move a file" ) 
a3=$(zenity --title=File Management --entry --text="Enter folder name 1")
a4=$(zenity --title=File Management --entry --text="Enter file of this folder")
a5=$(zenity --title=File Management --entry --text="Enter folder name 2")
mv $a3/$a4 $a5/$a4
zenity --title=File management --info --text="File $a4 moved from $a3 to $a5"
;;
"Copy a file" )
a6=$(zenity --title=File Management --entry --text="Enter folder name 1")
a7=$(zenity --title=File Management --entry --text="Enter file from this folder which is to be copied")
a8=$(zenity --title=File Management --entry --text="Enter folder name 2")
cp $a6/$a7 $a8/$a7
zenity --title=File management --info --text="File $a7 copied from $a6 to $a8"
;;
"Create a link on Desktop" ) cp $cp -l 
a9=$(zenity --title=File Management --entry --text="Enter name of file whose link is to be created")
a10=$(zenity --title=File Management --entry --text="Enter link of file name")
cp -l $a9 $a10
;;
"Compare a file" )
a11=$(zenity --title=File Management --entry --text="Enter file name 1")
a12=$(zenity --title=File Management --entry --text="Enter file name 2")
a13=$(cmp $a11 $a12)
zenity --title=File management --info --text="RESULT:$a13"
;;

"Exit" )
zenity --info --title="Thank you"
break
;;
*);;
esac
