#!/usr/bin/env sh
if [ -e "netgrubfm*.7z" ]
then
    rm netgrubfm*.7z
fi

i=0
for lang in zh_CN zh_TW en_US tr_TR de_DE vi_VN ru_RU he_IL
do
    if [ -d "releases" ]
    then
        rm -r releases
    fi
    mkdir releases
    i=`expr $i + 1`
    echo "${i}" | ./build.sh
    cp grubfm.iso releases/
    cp grubfm*.efi releases/
    cp loadfm releases/
	cp tftpboot releases/
    cd releases
    7z a ../netgrubfm-${lang}.7z *
    cd ..
    rm -r releases
done
