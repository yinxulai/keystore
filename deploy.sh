#! /bin/bash

# 复制.key 文件到
# 添加 key config
# 使用管理员权限运行
# key 目前仅支持放在脚本同级目录中
# TODO 目前追加写入配置 可能会有重复
# 脚本使用 ./deploy.sh name root 192.168.0.1 22 ./ssh.key
# 参数说明 ./deploy.sh 别名 #user #服务器  #端口  #证书
# 部署完 ssh 可以使用别名来进行登陆: ssh name name 为别名

sshDir="./test";

if [ -f $5 ]; then
    if [ ! -e $sshDir ]; then
      mkdir $sshDir;
    fi

    yes | cp $5 $sshDir/$5;
    sudo chmod 644 $sshDir/$5
    echo "HostName $1" >> $sshDir/config
    echo "    User $2" >> $sshDir/config
    echo "    Host $3" >> $sshDir/config
    echo "    Port $4" >> $sshDir/config
    echo "    IdentityFile $5" >> $sshDir/config
fi
