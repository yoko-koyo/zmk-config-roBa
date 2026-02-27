#!/bin/bash
# 1. 右手だけを高速ビルド
INCREMENTAL=true ./build_local.sh build seeeduino_xiao_ble_roBa_R

# 2. ビルドが成功したら書き込みスクリプトを自動起動
if [ $? -eq 0 ]; then
    ./flash.sh
else
    echo "ビルドに失敗したため、書き込みを中止しました。"
fi
