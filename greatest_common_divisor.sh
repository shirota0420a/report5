#!/bin/bash

# 入力数の確認
isArgsOK(){
  if [ ! $1 == 2 ]; then
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
      return 1
    fi
  else
    return 1
  fi
}
Info(){ echo "[INF]$1"; }
Error(){ echo "[ERR]$1"; }

u=$1
v=$2
if ! isArgsOK "${#}"; then
  Error "Input 2 arguments"
  exit 1
fi

if ! isNaturalNumber "${u}" || ! isNaturalNumber "${v}"; then
  Error "Input natural number"
  exit 1
fi

#Info "Inputs OK"

# 最大公約数の計算（ユークリッドの互除法）
while [ $v -gt 0 ]
do
  r=`expr $u % $v`
  u=$v
  v=$r
done
echo $u

#Info "Calc OK"
