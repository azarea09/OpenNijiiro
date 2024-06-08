@echo off
REM ファイルがドラッグアンドドロップされた場合、そのファイルのパスを取得して変数に格納
set input_file=%1

REM 入力ファイルが存在しない場合はエラーメッセージを表示して終了
if not exist "%input_file%" (
    echo 入力ファイルが見つかりません。
    pause
    exit /b
)

REM ffmpegコマンドを実行して、入力ファイルをPNG形式の画像に変換
ffmpeg -i "%input_file%" -pix_fmt rgba "%%04d.png"

pause