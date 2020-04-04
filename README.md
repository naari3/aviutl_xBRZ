# aviutl_xBRZ

Using xBRZ (upscaling filter) in aviutl.

![1](https://user-images.githubusercontent.com/12756563/78413833-37940780-7654-11ea-8aa0-9ae7693156d4.png)

![2](https://user-images.githubusercontent.com/12756563/78413851-47135080-7654-11ea-9e44-9589211dcbd2.png)

Download from [here](https://github.com/naari3/aviutl_xBRZ/releases)

This project used xBRZ library from [here](https://sourceforge.net/projects/xbrz/)

## インストール方法

1. 事前に拡張編集plugin導入済みの aviutl でLuaJITを有効にする
  1. 例えば aviutl v1.10 の場合は拡張編集の `環境設定` `LuaJITを利用する` にチェックを入れておく
1. [Release](https://github.com/naari3/aviutl_xBRZ/releases) から最新のzipをダウンロード
1. ダウンロードしたzipを解凍し出てきた `xBRZ` フォルダを拡張編集plugin導入済みの aviutl の `script` フォルダにドラッグ&ドロップ
1. aviutl を起動し、フィルターを掛けたい対象に `アニメーション効果` を適用し、続けて `xBRZ` を適用する
