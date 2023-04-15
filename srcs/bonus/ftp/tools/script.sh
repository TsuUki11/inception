#! bin/bash

sed -i "s+anonymous_enable=NO+anonymous_enable=YES+g" /etc/vsftpd.conf
sed -i "s+#chroot_local_user=YES+chroot_local_user=YES+g" /etc/vsftpd.conf
sed -i "s+#write_enable=YES+write_enable=YES+g" /etc/vsftpd.conf
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
echo "userlist_enable=YES" >> /etc/vsftpd.conf
echo "userlist_deny=NO" >> /etc/vsftpd.conf
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf
echo "local_root=/var/www/html" >> /etc/vsftpd.conf

mkdir -p /var/run/vsftpd/empty

adduser --disabled-password --gecos "" $FTP_USER

echo "$FTP_USER:$FTP_PASS" | chpasswd

echo $FTP_USER > /etc/vsftpd.userlist

chown $FTP_USER:$FTP_USER /var/www/html

vsftpd