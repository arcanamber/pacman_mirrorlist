#!/bin/sh

sudo curl 'https://archlinux.org/mirrorlist/?country=US&protocol=http&protocol=https&ip_version=4' > /etc/pacman.d/mirrorlist
sudo perl -pi -e 's/^#S/S/g' /etc/pacman.d/mirrorlist

date_in_gmt=$(TZ="GMT" date "+%Y-%m-%d")
mirrorlist=$(cat /etc/pacman.d/mirrorlist)
if echo "$mirrorlist" | grep -q "# Generated on $date_in_gmt"; then
  echo "Mirrorlist updated and verified."
else
  echo "Error: Mirrorlist update failed or verification check failed." >&2
fi
