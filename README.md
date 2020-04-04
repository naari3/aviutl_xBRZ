# aviutl_xBRZ

Using xBRZ (upscaling filter) in aviutl.

![1](https://user-images.githubusercontent.com/12756563/78413833-37940780-7654-11ea-8aa0-9ae7693156d4.png)

![2](https://user-images.githubusercontent.com/12756563/78413851-47135080-7654-11ea-9e44-9589211dcbd2.png)

Download from [here](https://github.com/naari3/aviutl_xBRZ/releases)

This project used xBRZ library from [here](https://sourceforge.net/projects/xbrz/)

## インストール方法

1. 事前に拡張編集plugin導入済みの aviutl でLuaJITを有効にする
    - 例えば aviutl v1.10 の場合は拡張編集の `環境設定` `LuaJITを利用する` にチェックを入れておく
2. [Release](https://github.com/naari3/aviutl_xBRZ/releases) から最新のzipをダウンロード
3. ダウンロードしたzipを解凍し出てきた `xBRZ` フォルダを拡張編集plugin導入済みの aviutl の `script` フォルダにドラッグ&ドロップ
4. aviutl を起動し、フィルターを掛けたい対象に `アニメーション効果` を適用し、続けて `xBRZ` を適用する

## パラメータ

#### 倍率

- 2 ~ 6 が選択可能
- 2 の場合は 2倍
- 後述の解像度の制限の影響を受ける可能性あり

#### 解像度無制限

- チェックしない場合
  - aviutlの `システムの設定/最大画像サイズ` より大きい場合、画像の生成が行われなくなる
- チェックする場合
  - 上記の制限を無視する
  - 生成結果の画像サイズがあまりにも大きい場合に例外が発生するため注意が必要

#### バッファを使用する

- スケールする際にバッファを作成/使用しないため、オーバーヘッド(200 ~ 300 ms)を無視できる/生成が遅くなる
- あまり効果なさそう
