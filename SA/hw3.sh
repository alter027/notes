# after install pure-ftpd zfs samba openssl ssh
# pure-ftpd
echo 2 > /etc/pure-ftpd/conf/TLS
mkdir -p /etc/ssl/private/
openssl req -x509 -nodes -days 7300 -newkey rsa:2048 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem
chmod 600 /etc/ssl/private/pure-ftpd.pem
/etc/init.d/pure-ftpd-mysql start
ln -s /etc/pure-ftpd/conf/PureDB 60puredb
# ln -s /etc/pure-ftpd/conf/PureDB /etc/pure-ftpd/auth/60puredb
/etc/init.d/pure-ftpd start
pure-pw mkdb
groupadd ftpgroup
useradd ftp -g ftpgroup -s /bin/false -d /home/ftp
/etc/init.d/pure-ftpd restart
mkdir /home/ftp
useradd ftpuser -g ftpgroup -s /bin/false -d /home/ftp
pure-pw useradd ftp-tri -u ftpuser -d /home/ftp
pure-pw mkdb

# zfs
fdisk -l
zpool create zroot /dev/sdb -f
zfs create -o canmount=noauto -o mountpoint=/home/ftp zroot/ftp
df
zpool list
zfs list
zfs snapshot zroot/ftp@171114
zfs list -t snapshot
# 開機後自動掛載
echo "zfs mount -vO -a" >> /etc/rc.local
zfs get mounted

# samba
vim smb.conf 
sudo /etc/init.d/samba restart
ifconfig
smbpasswd -a Samba
smbpasswd -a sysadm
smbpasswd -a ftp-vip
smbpasswd -a Anonymous
smbpasswd -a ttl

# ssh
/etc/init.d/ssh start
