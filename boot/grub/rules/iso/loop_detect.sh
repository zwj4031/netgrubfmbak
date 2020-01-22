# Grub2-FileManager
# Copyright (C) 2016,2017,2018,2019,2020  A1ive.
#
# Grub2-FileManager is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Grub2-FileManager is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Grub2-FileManager.  If not, see <http://www.gnu.org/licenses/>.

source ${prefix}/func.sh;

function iso_detect {
  unset icon;
  unset distro;
  unset src;
  unset linux_extra;
  probe --set=rootuuid -u "(${grubfm_device})";
  probe --set=looplabel -q --label (loop);
  probe --set=loopuuid -u (loop);
  if [ -d (loop)/casper ];
  then
    export linux_extra="iso-scan/filename=${grubfm_path}";
    export icon=ubuntu;
    export distro="Ubuntu";
    export src=ubuntu;
    return;
  fi;
  if [ -d (loop)/arch ];
  then
    if [ -f (loop)/boot/vmlinuz_* ];
    then
      export linux_extra="iso_loop_dev=/dev/disk/by-uuid/${rootuuid} iso_loop_path=${grubfm_path}";
    else
      export linux_extra="img_dev=/dev/disk/by-uuid/${rootuuid} img_loop=${grubfm_path} archisolabel=${looplabel}";
    fi;
    export icon=archlinux;
    export distro="Arch Linux";
    export src=archlinux;
    return;
  fi;
  if [ -d (loop)/parabola ];
  then
    export linux_extra="img_dev=/dev/disk/by-uuid/${rootuuid} img_loop=${grubfm_path} parabolaisolabel=${looplabel}";
    export icon=archlinux;
    export distro="Parabola";
    export src=parabola;
    return;
  fi;
  if [ -d (loop)/blackarch ];
  then
    export linux_extra="img_dev=/dev/disk/by-uuid/${rootuuid} img_loop=${grubfm_path} archisolabel=${looplabel}";
    export icon=archlinux;
    export distro="BlackArch";
    export src=blackarch;
    return;
  fi;
  if [ -d (loop)/hyperbola ];
  then
    export linux_extra="img_dev=/dev/disk/by-uuid/${rootuuid} img_loop=${grubfm_path} hyperisolabel=${looplabel}";
    export icon=archlinux;
    export distro="Hyperbola";
    export src=hyper;
    return;
  fi;
  if [ -d (loop)/kdeos ];
  then
    export linux_extra="img_dev=/dev/disk/by-uuid/${rootuuid} img_loop=${grubfm_path} kdeisolabel=${looplabel}";
    export icon=kaos;
    export distro="KaOS";
    export src=kaos;
    return;
  fi;
  if [ -d (loop)/manjaro ];
  then
    export linux_extra="img_dev=/dev/disk/by-uuid/${rootuuid} img_loop=${grubfm_path} misolabel=${looplabel}";
    export icon=manjaro;
    export distro="Manjaro";
    export src=manjaro;
    return;
  fi;
  if [ -d (loop)/chakra ];
  then
    export linux_extra="img_dev=/dev/disk/by-uuid/${rootuuid} img_loop=${grubfm_path} chakraisolabel=${looplabel}";
    export icon=chakra;
    export distro="Chakra";
    export src=chakra;
    return;
  fi;
  if [ -d (loop)/siduction ];
  then
    export linux_extra="fromiso=${grubfm_path}";
    export icon=siduction;
    export distro="siduction";
    export src=siduction;
    return;
  fi;
  if [ -f (loop)/sysrcd.dat ];
  then
    export linux_extra="isoloop=${grubfm_path}";
    export icon=gentoo;
    export distro="System Rescue CD";
    export src=sysrcd;
    return;
  fi;
  if [ -d (loop)/sysresccd ];
  then
    export linux_extra="img_dev=/dev/disk/by-uuid/${rootuuid} img_loop=${grubfm_path} archisolabel=${looplabel}";
    export icon=archlinux;
    export distro="System Rescue CD";
    export src=sysresccd;
    return;
  fi;
  if [ -f (loop)/ipfire*.media ];
  then
    export linux_extra="bootfromiso=${grubfm_path}";
    export icon=ipfire;
    export distro="IPFire";
    export src=ipfire;
    return;
  fi;
  if [ -f (loop)/isolinux/vmlinuz -a -f (loop)/isolinux/initrd.gz -a -f (loop)/livecd.sqfs ];
  then
    export linux_extra="root=UUID=${rootuuid} isoboot=${grubfm_path}";
    export icon=pclinuxos;
    export distro="PCLinuxOS";
    export src=pclinuxos;
    return;
  fi;
  if [ -f (loop)/livecd.squashfs ];
  then
    export linux_extra="isoboot=${grubfm_path} root=live:LABEL=${looplabel} iso-scan/filename=${grubfm_path}";
    export icon=gnu-linux;
    export distro="Calculate Linux";
    export src=calculate;
    return;
  fi;
  if [ -f (loop)/kernel -a -f (loop)/initrd.img -a -f (loop)/system.sfs ];
  then
    export linux_extra="iso-scan/filename=${grubfm_path}";
    export icon=android;
    export distro="Android-x86";
    export src=android;
    return;
  fi;
  if [ -d (loop)/porteus ];
  then
    export linux_extra="from=${grubfm_path}";
    export icon=porteus;
    export distro="Porteus";
    export src=porteus;
    return;
  fi;
  if [ -d (loop)/slax ];
  then
    export linux_extra="from=${grubfm_path}";
    export icon=slax;
    export distro="Slax";
    export src=slax;
    return;
  fi;
  if [ -d (loop)/wifislax ];
  then
    export linux_extra="from=${grubfm_path}";
    export icon=wifislax;
    export distro="Wifislax";
    export src=wifislax;
    return;
  fi;
  if [ -d (loop)/wifislax64 ];
  then
    export linux_extra="livemedia=/dev/disk/by-uuid/${rootuuid}:${grubfm_path}";
    export icon=wifislax;
    export distro="Wifislax64";
    export src=wifislax;
    return;
  fi;
  if [ -d (loop)/wifiway ];
  then
    export linux_extra="from=${grubfm_path}";
    export icon=wifislax;
    export distro="Wifiway";
    export src=wifislax;
    return;
  fi;
  if [ -d (loop)/pmagic ];
  then
    export linux_extra="iso_filename=${grubfm_path}";
    export icon=pmagic;
    export distro="Parted Magic";
    export src=pmagic;
    return;
  fi;
  if [ -d (loop)/ploplinux ];
  then
    export linux_extra="iso_filename=${grubfm_path}";
    export icon=gnu-linux;
    export distro="Plop Linux";
    export src=plop;
    return;
  fi;
  if [ -d (loop)/liveslak ];
  then
    export linux_extra="livemedia=scandev:${grubfm_path}";
    export icon=slackware;
    export distro="Slackware Live";
    export src=liveslack;
    return;
  fi;
  if [ -d (loop)/antix ];
  then
    export linux_extra="fromiso=${grubfm_path} from=hd,usb";
    export icon=debian;
    export distro="antiX";
    export src=antix;
    return;
  fi;
  if [ -d (loop)/live ];
  then
    export linux_extra="findiso=${grubfm_path}";
    export icon=debian;
    export distro="Debian";
    export src=debian;
    return;
  fi;
  if [ -f (loop)/isolinux/gentoo -o -f (loop)/isolinux/gentoo64 ];
  then
    export linux_extra="isoboot=${grubfm_path}";
    export icon=gentoo;
    export distro="Gentoo";
    export src=gentoo;
    return;
  fi;
  if [ -f (loop)/isolinux/pentoo ];
  then
    export linux_extra="isoboot=${grubfm_path}";
    export icon=gentoo;
    export distro="Pentoo";
    export src=pentoo;
    return;
  fi;
  if [ -f (loop)/boot/sabayon ];
  then
    export linux_extra="isoboot=${grubfm_path}";
    export icon=sabayon;
    export distro="Sabayon";
    export src=sabayon;
    return;
  fi;
  if [ -f (loop)/boot/core.gz -o -f (loop)/boot/corepure64.gz ];
  then
    export linux_extra="iso=UUID=${rootuuid}${grubfm_path}";
    export icon=gnu-linux;
    export distro="TinyCore";
    export src=tinycore;
    return;
  fi;
  if [ -d (loop)/LiveOS ];
  then
    export linux_extra="root=live:CDLABEL=${looplabel} iso-scan/filename=${grubfm_path}";
    export icon=fedora;
    export distro="Fedora";
    export src=fedora;
    return;
  fi;
  if [ -f (loop)/images/pxeboot/vmlinuz ];
  then
    export linux_extra="inst.stage2=hd:UUID=${loopuuid} iso-scan/filename=${grubfm_path}";
    export icon=fedora;
    export distro="Fedora";
    export src=fedora;
    return;
  fi;
  if [ -f (loop)/boot/x86_64/loader/linux -o -f (loop)/boot/i386/loader/linux -o -f (loop)/boot/ix86/loader/linux ];
  then
    export linux_extra="isofrom_system=${grubfm_path} isofrom_device=/dev/disk/by-uuid/${rootuuid}";
    export icon=opensuse;
    export distro="OpenSUSE";
    export src=suse64;
    return;
  fi;
  if [ -f (loop)/boot/isolinux/minirt.gz ];
  then
    export linux_extra="bootfrom=/dev/disk/by-uuid/${rootuuid}${grubfm_path}";
    export icon=knoppix;
    export distro="Knoppix";
    export src=knoppix;
    return;
  fi;
  if [ -f (loop)/boot/kernel/kernel* -o -f (loop)/boot/kernel/kfreebsd.gz ];
  then
    export linux_extra="${grubfm_file}";
    export icon=freebsd;
    export distro="FreeBSD";
    export src=freebsd;
  fi;
}

iso_detect;
if [ -n "${src}" ];
then
  configfile ${prefix}/distro/${src}.sh;
fi;
