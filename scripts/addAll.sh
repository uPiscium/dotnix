#!/usr/bin/env sh

echo -e "\033[1;32mAdd all files to git repository.\033[0m";
echo -e "\033[1;32mChecking for over 100M files.\033[0m";
set files=$(find . -size +100M);

if [ ! -f .gitignore ]; then
  echo -e "\033[1;31mNo .gitignore file found.\033[0m";
  echo -ne "\033[1;32mProceed? (y/N)\033[0m";
  read answer;
  if [ "$answer" != "n" ]; then
    echo -ne "\033[1;32mSkip .gitignore file.\033[0m";
  else
    exit 1;
  fi
else
  cat .gitignore | grep -v '^#' | grep -v '^$' | while read line; do
    set files=$(echo "$files" | grep -v "$line");
  done
fi

if [ -n "$files" ]; then
  echo -e "\033[1;31mOver 100M files detected.\033[0m";
  for file in $files; do
    echo -e "\033[1;31m$file\033[0m";
  done
  echo -ne "\033[1;32mAdd the files to .gitignore file? (y/N)\033[0m";
  read answer;
  if [ "$answer" = "y" ]; then
    for file in $files; do
      echo "${file}" >> .gitignore;
    done
    git add --all;
  else
    echo -e "\033[31mPlease remove the files and try again.\033[0m";
  fi
else
  git add --all;
fi
