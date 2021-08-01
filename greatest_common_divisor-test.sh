#!/bin/bash

Error(){ echo "[ERR]$1"; }
ans="/tmp/$$-ans"
result="/tmp/$$-result"
err="/tmp/$$-error"

# 1: 入力数のチェック
echo "[ERR]Input 2 arguments" > ${ans}
# 1-1: 入力数0
./greatest_common_divisor.sh > ${result}
diff ${ans} ${result} || Error "1-1" >> ${err}

# 1-2: 入力数1
./greatest_common_divisor.sh 1 > ${result}
diff ${ans} ${result} || Error "1-2" >> ${err}

# 1-3: 入力数3
./greatest_common_divisor.sh 1 1 1 > ${result}
diff ${ans} ${result} || Error "1-3" >> ${err}

# 1-3: 入力数4
./greatest_common_divisor.sh 1 1 1 1 > ${result}
diff ${ans} ${result} || Error "1-4" >> ${err}

# 2: 自然数のチェック(1 2 3 4 ... N)
echo "[ERR]Input natural number" > ${ans}
# 2-1: 負数(両方)
./greatest_common_divisor.sh -1 -1 > ${result}
diff ${ans} ${result} || Error "2-1" >> ${err}

# 2-2: 負数(引数1)
./greatest_common_divisor.sh -1 1 > ${result}
diff ${ans} ${result} || Error "2-2" >> ${err}

# 2-3 負数(引数2)
./greatest_common_divisor.sh 1 -1 > ${result}
diff ${ans} ${result} || Error "2-3" >> ${err}

# 2-4 小数(両方)
./greatest_common_divisor.sh 1.1 1.1 > ${result}
diff ${ans} ${result} || Error "2-4" >> ${err}

# 2-5 小数(引数1)
./greatest_common_divisor.sh 1.1 1 > ${result}
diff ${ans} ${result} || Error "2-5" >> ${err}

# 2-6 小数(引数2)
./greatest_common_divisor.sh 1 1.1 > ${result}
diff ${ans} ${result} || Error "2-6" >> ${err}

# 2-7 0値(両方)
./greatest_common_divisor.sh 0 0 > ${result}
diff ${ans} ${result} || Error "2-7" >> ${err}

# 2-8 0値(引数1)
./greatest_common_divisor.sh 0 10 > ${result}
diff ${ans} ${result} || Error "2-8" >> ${err}

# 2-9 0値(引数2)
./greatest_common_divisor.sh 10 0 > ${result}
diff ${ans} ${result} || Error "2-9" >> ${err}

# 2-10 数値以外(両方)
./greatest_common_divisor.sh a a > ${result}
diff ${ans} ${result} || Error "2-10" >> ${err}

# 2-11 数値以外(引数1)
./greatest_common_divisor.sh a 1 > ${result}
diff ${ans} ${result} || Error "2-11" >> ${err}

# 2-12 数値以外(引数2)
./greatest_common_divisor.sh 1 a > ${result}
diff ${ans} ${result} || Error "2-12" >> ${err}

# 3: 最大公約数の計算
# 3-1: 1 1
echo "1" > ${ans}
./greatest_common_divisor.sh 1 1 > ${result}
diff ${ans} ${result} || Error "3-1" >> ${err}

# 3-2: 6 3
echo "3" > ${ans}
./greatest_common_divisor.sh 6 3 > ${result}
diff ${ans} ${result} || Error "3-2" >> ${err}

# 3-3: 27 18
echo "9" > ${ans}
./greatest_common_divisor.sh 27 18 > ${result}
diff ${ans} ${result} || Error "3-3" >> ${err}

# 3-4: 50 24
echo "2" > ${ans}
./greatest_common_divisor.sh 50 24 > ${result}
diff ${ans} ${result} || Error "3-4" >> ${err}

# 3-5: 876 204
echo "12" > ${ans}
./greatest_common_divisor.sh 876 204 > ${result}
diff ${ans} ${result} || Error "3-5" >> ${err}

# 3-6: 1024 512
echo "512" > ${ans}
./greatest_common_divisor.sh 1024 512 > ${result}
diff ${ans} ${result} || Error "3-6" >> ${err}

if [ -f ${err} ]; then
  cat ${err}
  rm /tmp/$$-*
  exit 1
else
  rm /tmp/$$-*
fi

