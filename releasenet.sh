#!/usr/bin/env sh
if [ -e "netgrubfm.tar.gz" ]
then
    rm netgrubfm.tar.gz
fi
tar -zcvf grub.tar.gz tftpboot
mv grub.tar.gz ../../netgrubfm.tar.gz
