#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../../"
git pull --all --rebase --autostash
cd -

echo -----------------------------------------------------------
echo Update
echo -----------------------------------------------------------
sudo apt-get update

echo -----------------------------------------------------------
echo Upgrade
echo -----------------------------------------------------------
sudo apt-get -y upgrade

echo -----------------------------------------------------------
echo Dist-upgrade
echo -----------------------------------------------------------
sudo apt-get -y dist-upgrade

echo -----------------------------------------------------------
echo autoremove
echo -----------------------------------------------------------
sudo apt-get -y autoremove

echo -----------------------------------------------------------
echo autoclean
echo -----------------------------------------------------------
sudo apt-get -y autoclean

if [ -d ~/project/server ]; then
  echo -----------------------------------------------------------
  echo Rebase server repository
  echo -----------------------------------------------------------
  cd ~/project/server
  git pull --rebase
  cd -
fi

if [[ $(type -P "snap") ]]; then
  echo -----------------------------------------------------------
  echo Update snap
  echo -----------------------------------------------------------
  sudo snap refresh
fi

echo -----------------------------------------------------------
echo update zoom
echo -----------------------------------------------------------
if command -v zoom &>/dev/null; then
  url=https://zoom.us/client/latest/
  file=zoom_amd64.deb
  cd ~/Downloads

  wget -qN $url$file
  downloadedVer=$(dpkg -f $file version)

  dpkgReport=$(dpkg -s zoom)
  echo "$dpkgReport" | grep '^Status: install ok' >/dev/null &&
    installedVer=$(echo "$dpkgReport" | grep ^Version: | sed -e 's/Version: //')

  if [ "$installedVer" != "$downloadedVer" ]; then
    sudo dpkg -i $file
  else
    echo "Zoom is up to date"
  fi
fi
