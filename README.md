# Copy \<50 files to another dir and rename to ([1-4][0-9]|50).\<filetype\>

This is just a small programm that could be easly done using a shellscript, however it should be platform independent.
It's made for a friend who has a loop station that exclusivly accapts an input of \<50 audio files following the above filename pattern.
Files are copied instead of "moved" to not loose the original file on errors while processing.

## Linux (bash)

For convenience of linux users there is a simple bash script that will do the job. Hence no verification yet if source and target files are the same.

### Usage

**Important:** Do not execute the script from the directory the audio files reside in. (For now, may be fixed later.)

Download the *rename-files-for-loopstation.sh* script from the *scripts* directory to your computer, e.g. the *Downloads* directory.

Assuming the audio files reside in */Downloads/audio/* and the script in */Downloads*  you will have to do the following:

1. Open a Terminal in the Downloads folder. (Right click, *Open Terminal*)
2. Make the script executable: ```chmod u+x rename-files-for-loopstation.sh```
3. Run the script: ```./rename-files-for-loopstation.sh audio```

The last command will run the script and create a directory *Renamend files* in the current, i.e. *Download*, directory.
