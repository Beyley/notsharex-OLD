#!/bin/bash
# A tool to take a screenshot using xfce4-screenshooter, copy it to a samba share which
# has a webserver hosting that image

################################################################
#                                                              #
#     Written by Beyley Thomas (https://github.com/Beyley)     #
#                                                              #
################################################################

# Create the config folder
config_directory=~/.config/notsharex
mkdir $config_directory

# Pull things from the config
credfile=$config_directory/.sambacreds

# Source the main config file
. $config_directory/config.sh

# Grab the screenshot
xfce4-screenshooter -r -s /tmp/temp.png

# Mount the server with the credentials
gio mount $server/$share < $credfile

# Create the temporary directory
mkdir $tempfolder

echo "Server type is $conntype"

if [ $conntype == 'smb' ] 
then
	mount_folder=smb-share\:server\=$server_name\,share\=$share
elif [ $conntype == 'ftp' ]
then
	mount_folder=ftp\:host\=$server_name
fi

# Links the mounted dir to the temporary one
echo "ln -s /run/user/1000/gvfs/$mount_folder/ $tempfolder/"
ln -s /run/user/1000/gvfs/$mount_folder/ $tempfolder/

# Generates a random string
random=$(xxd -l $random_string_length -c $random_string_length -p < /dev/urandom)

# Copy the temporary image to the samba share
cp /tmp/temp.png $tempfolder/$mount_folder/$path_to_move_to/$random.png

# Remove the temporary image from the temp folder
rm /tmp/temp.png

# Write the link to the clipboard
echo "$link/$random.png" | xclip -i -selection clipboard

# Say a message when the script is complete
spd-say -i -95 "$end_message"
