# notsharex
Create a file in `~/.config/notsharex/` called `config.sh` with the selection of samba and FTP support

FTP
```bash
# Connection type
conntype='ftp'

# Server address
server=ftp://SERVERADDRESS
# Name of server
server_name=SERVERADDRESS
# The temporary folder
tempfolder=/tmp/notsharex
# Link where the file will be
link=https://i.beyleyisnotcute.tk
# Path in the server to move the image to
path_to_move_to=home/beyley/image-subdomain
# How long to make the random string
random_string_length=5
# Message to say when done
end_message='gawr gura go F T P'
```

SMB
```bash
# Connection type
conntype='smb'

# Server address
server=smb://SERVERADDRESS
# Name of server
server_name=SERVERADDRESS
# Server share
share=SHARENAME
# The temporary folder
tempfolder=/tmp/notsharex
# Link where the file will be
link=https://i.beyleyisnotcute.tk
# Path in the server to move the image to
path_to_move_to=home/beyley/image-subdomain
# How long to make the random string
random_string_length=5
# Message to say when done
end_message='gawr gura go S M B'
```

CREDENTIAL FILES
FTP
```
USER
PASS
```

SMB
```
USER
WORKGROUP
PASS
```
