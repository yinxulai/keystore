#! /bin/bash

for file in `ls`; do
  if [ -f $file ]; then
    fileName=${file%.*};
    fileFormat=${file##*.};
    echo $fileFormat $fileName;

      if [ $1 = "d" ]; then
        if [ $fileFormat = "enc" ]; then
          echo "Dncrypt file $file to $fileName";
          openssl enc -aes-256-cbc -d -K $2 -iv $3 -in ./$file -out ./$fileName;
        fi
      elif [ $1 = "e" ]; then
        if [ $fileFormat = "key" ]; then
          echo "Encrypt file $file to $fileName";
          openssl enc -aes-256-cbc -K $2 -iv $3 -in ./$file -out ./$file.enc;
        fi
      fi
  fi
done



