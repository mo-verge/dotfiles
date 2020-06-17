```
sudo apt update
sudo apt install samba

cp ~/dotfiles/samba/smb.conf /etc/samba/

smbpasswd -a mo

sudo service smbd restart
```


