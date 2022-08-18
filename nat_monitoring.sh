#!/bin/bash -e

# ログ出力先指定(指定がない場合は/tmp)
LOG_OUTPUT_PATH="${LOG_OUTPUT_PATH:-/tmp}"

# ログファイル名指定
LOG_FILE_NAME="$(date '+%Y-%m-%d_%T').log"

# テスト回数指定
TEST_NUM="10"

# 疎通先引数がない場合
if [ -z "$1" ]; then
	echo "[Info] 疎通先が指定されませんでしたので,1.1.1.1で実行します."
	mtr -c $TEST_NUM 1.1.1.1 -r -n -w >> $LOG_OUTPUT_PATH/$LOG_FILE_NAME
else
	echo "[Info] $1へ疎通確認を行います."
	mtr -c $TEST_NUM $1 -r -n -w >> $LOG_OUTPUT_PATH/$LOG_FILE_NAME
fi
