#!/bin/bash

# 入力数の確認
isArgsOK(){
  if [ ! $1 == 2 ]; then
    echo "Two arguments are required"
    return 1
  else
    return 0
  fi
}

# 自然数かどうかの確認
isNaturalNumber(){
  if [[ "$1" =~ ^[0-9]+$ ]] ; then
    if [ ! "$1" == "0" ] ; then
      return 0
    else
      echo "'${1}' is not a Natural number"
      return 1
    fi
  else
    echo "'${1}' is not a Natural number"
    return 1
  fi
}

u=$1
v=$2
if ! isArgsOK "${#}"; then
  echo "ERROR EXIT"
  exit 1
fi

if ! isNaturalNumber "${u}" || ! isNaturalNumber "${v}"; then
  echo "ERROR EXIT"
  exit 1
fi

while [ $v -gt 0 ]
do
  r=`expr $u % $v`
  u=$v
  v=$r
done
echo $u
