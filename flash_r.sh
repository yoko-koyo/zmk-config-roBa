#!/bin/bash
INCREMENTAL=true ./build_local.sh build seeeduino_xiao_ble_roBa_R
if [ $? -ne 0 ]; then
    echo "[ERROR] ビルド失敗"
    exit 1
fi

DRIVE_NAME="NO NAME"
UF2_PATH="./build/seeeduino_xiao_ble_roBa_R/zephyr/zmk.uf2"

echo "右手ダブルクリック待ち..."
while [ ! -d "/Volumes/$DRIVE_NAME" ]; do sleep 1; done

echo "書き込み中..."
# エラーを無視しつつコピー
cp -X "$UF2_PATH" "/Volumes/$DRIVE_NAME/" 2>/dev/null || true

# 書き込み完了まで少し待つ
sleep 2
echo "【完了】キーボードを確認してください。"
