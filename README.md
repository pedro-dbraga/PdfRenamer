# PdfRenamer
I made this script to help my wife rename many pdfs at once in her job. 

!Never use the spaces between words that name a file!
Search for PowerShell(if you don’t have it, download)

Start - 

Create a folder where you will work

You will need some files to make everything happen

Inside the workspace’s folder: 

Create a folder to put the pdfs
Create a .txt to put the paths
Create a .txt with every new name you want to rename the files (just the name ex: Newname - don’t use .pdf, .csv or .txt)
You don’t need to put the script in this folder

Now you click with the mouse’s right button and select “Copy as Path”

Copy and paste on path’s file.

Erase the quotation marks “”

We need 4 paths.

Pdf's folder path
ex: C:\Users\UserName\Desktop\workspace\pdfs

Students file path
ex: C:\Users\UserName\Desktop\workspace\students.txt

Workspace folder path
ex: C:\Users\UserName\Desktop\workspace

New sheet path (you will get this after using the first script)
ex: C:\Users\UserName\Desktop\workspace\new_list.csv

If you made the paths.txt and the students.txt right, now you can use the script.

If you never use powershell, maybe you need to use this command to get permission to use this script -> Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

To use the script you can right clik the file and execute with powershell.  

This will create a file named new_list.csv (open and look if everything is ok)

Something like this - 
old_names ; new_names
C:\Users\UserName\Desktop\workspace\pdfs\pdf1.pdf ; C:\Users\UserName\Desktop\workspace\pdfs\Pedro.pdf

If everything is ok the script will rename every pdf in pdf's folder to the same new name column in the sheet line
