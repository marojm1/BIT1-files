@ECHO  off 
Rem MAIN.BAT
rem this script carries out task for BIT platforms and devices Batchscript 
:: Joanna Marowa ,1000123807
:: platforms and devices 2024 Semester 1

ECHO . 
ECHO   A1: Output a line to the screen that displays my name 
ECHO   using the ECHO  command 
ECHO   Joanna Marowa
PAUSE
CLS 

ECHO .
ECHO   A2 : Outputs the file name to the screen (not hard coded!).
ECHO   using the ECHO  command
ECHO   %~n0
PAUSE
CLS 

ECHO .
ECHO   A3 : Create a folder on the root of the C: drive called "My Batch Script File Assignment"
ECHO   using the mkdir command
MKDIR"C:\My Batch Script File Assignment"
ECHO   Folder created successfully
PAUSE
CLS 

ECHO .
ECHO   A4: Create a folder within  "My Batch Script File Assignment" called "Input"
ECHO   using the mkdir command
MKDIR  "C:\My Batch Script File Assignment\Input" 
ECHO   Folder created successfully
PAUSE
CLS 

ECHO .
ECHO   A5 : Create another folder within "My Batch Script File Assignment" called "Processing"
ECHO    using the cd and md commands
CD "C:\My Batch Script File Assignment" 
MD "Processing"
ECHO   Folder created successfully
PAUSE
CLS 

ECHO .
ECHO   A6: Create another folder within "My Batch Script File Assignment" called "Output"
ECHO   using the cd and md commands
MKDIR  "C:\My Batch Script File Assignment\Output"
ECHO   Folder created successfully 
PAUSE
CLS 

ECHO .
ECHO   A7 : List all hidden files in the root directory of the C: drive – output the listing to a file called "Input Data.txt" in the Input subfolder
ECHO  using the dir command
DIR  C:\ /A:H /S > "C:\My Batch Script File Assignment\Input\Input Data.txt"
ECHO  List of hidden files created!
PAUSE
CLS 

ECHO .
ECHO  A8: Make a backup copy of "Input Data.txt" on the root of the C: drive, and with the same name, but with extension .bak.
ECHO  using the dir command 
DIR C:\ /A:H /S > "C:\My Batch Script File Assignment\Input\Input Data.bak"
ECHO  Backup copy created 
PAUSE
CLS 

@ECHO on
ECHO   A9: Go to the root directory of the C: drive
ECHO   using the cd command 
CD \
ECHO  Now in the root directory of the C: drive
PAUSE
CLS 

@ECHO off
ECHO   A10: Update the folder search path for batch script file execution to include the "Processing" subfolder,
ECHO   and then display the folder search path.
ECHO   using the Path command 
SETX PATH "%PATH%;C:\My Batch Script File Assignment\Processing"
ECHO  Folder search path update successfully
ECHO  Updated folder search path :%PATH%
PAUSE
CLS 

@ECHO  on 
ECHO   A11: Change the command prompt to include the time, the words "Hello World" and the '>'character
ECHO   using the prompt command 
PROMPT =$T Hello World $G
ECHO  command prompt updated successfully
PAUSE
CLS 

@ECHO off
ECHO  A12: Create a new command window, with red coloured text and green background 
ECHO  using the start and color commands
START/I color 24
ECHO  New command window created successfully
PAUSE
CLS 

@ECHO on 
ECHO  A13: Create another new command window, with blue coloured text and a bright white
ECHO background, and with a prompt that includes the Windows version number.
ECHO  using the prompt, start and color commands
START cmd /k "color F1 & prompt $V"
ECHO  New command window created successfully
PAUSE
CLS

@ECHO off 
ECHO  A14: List all the folders (not files) in C:\WINDOWS\System32, sorted into alphabetical order – output the listing to a file called "Batch Script File Output Data.txt" in the "Output" subfolder
ECHO  using the dir command
DIR /AD /ON /B  "C:\WINDOWS\System32" |sort > "C:\My Batch Script File Assignment\Output\Batch Script File Output Data.txt"
ECHO File created successfully
PAUSE
CLS 

ECHO.
ECHO   A15: List all text files whose names are up to seven characters long on the whole C: drive – make the listing output in wide format – the listing output must be appended to the end of "Batch Script File Output Data.txt"
ECHO   using the dir command 
DIR  /S /W /A-D /B C:\*.txt | findstr /R "^.......$">>"C:/My Batch Script File Assigment/Output/Batch Script File Output Data.txt"
ECHO  Text file listing appended to the file successfully
PAUSE
CLS
 
ECHO.
ECHO   A16: Delete folder "My Batch Script File Assignment", together with all subfolders and their contents.
ECHO using the cd and rmdir commands
RMDIR/s "C:/My Batch Script File Assigment"
ECHO The command completed successfully.  
PAUSE
CLS 

ECHO.
ECHO   A17: Output to the screen the configuration information relating to your network settings.
ECHO  using the ipconfig command
IPCONFIG/all
ECHO The command completed successfully. 
PAUSE
CLS 

ECHO.
ECHO  A18:Create a local user called "Bob", then create a local group called "Awesome Users" and add Bob to it.
ECHO  using the net commands
NET user /add Bob Test@123
NET localgroup "Awesome Users" /add
NET localgroup "Awesome Users" Bob /add
ECHO localgroup "Awesome Users"
PAUSE
CLS 

ECHO.
ECHO  A19:Delete the group "Awesome Users" and delete the user "Bob".
ECHO  using the net commands
NET localgroup "Awesome Users" /delete
NET user BOb /delete 
ECHO user deleted 
PAUSE
CLS 

ECHO.
ECHO  A20:Create a task to be scheduled at 10 pm every Sunday that will check the C disk for errors 
ECHO  and write the results to a file called "chkdskResults.txt" on the desktop.
ECHO using the schtasks command
SCHTASKS/Create /SC WEEKLY /D SUN /TN "Check Disk" /TR "chkdsk C: > %USERPROFILE%\Desktop\chkdskResults.txt" /ST 22:00
ECHO Task created successfull
PAUSE
CLS 
