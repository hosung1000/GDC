#!/bin/sh
###############################################################
# Service > systemd > dotnet.service
# Sample Project > /root
# ip Change > 192.168.3."You linux ip"
# MariaDB > user(root)/password(test) > table(test.board)
###############################################################
gitPath=https://github.com/hosung1000/20190110_CHS_.git
rootDir=/root/Shell
projectDir2=20190110_CHS_/Project
projectDir=/20190110_CHS_

publishDir=/20190110_CHS_/Project/bin/Debug/netcoreapp2/publish
serviceDir=/publish


# 1. GitHub Repository Download
pwd
if [ -d $rootDir$projectDir ]; then
  rm -Rf $rootDir$projectDir

fi

# 2. Project Build

git clone $gitPath
cd $projectDir2
dotnet build

# 3. Service Shutdown

systemctl stop dotnet.service
pkill -9 -ef dotnet

# 4. Project Publish

dotnet publish

# 5. Service Run
systemctl start dotnet.service

###############################################################
exit 0
