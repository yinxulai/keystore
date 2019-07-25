#! /bin/bash

# 使用说明
# ./crypt.sh -d k iv 一键解密
# ./crypt.sh -e k iv 一键加密
# k iv 加密解密用到的密钥

for file in `ls`; do
  if [ -f $file ]; then
    fileName=${file%.*};
    fileFormat=${file##*.};

      if [ $1 = "-d" ]; then
        if [ $fileFormat = "enc" ]; then
          echo "Dncrypt file $file to $fileName";
          openssl enc -aes-256-cbc -d -K $2 -iv $3 -in ./$file -out ./$fileName;
        fi
      elif [ $1 = "-e" ]; then
        if [ $fileFormat = "key" ]; then
          echo "Encrypt file $file to $fileName";
          openssl enc -aes-256-cbc -K $2 -iv $3 -in ./$file -out ./$file.enc;
        fi
      fi
  fi
done



