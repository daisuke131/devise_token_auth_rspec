# APIでdevise_token_auth実装〜Rspecテスト

## Version

`ruby 2.6.1`

`rails 5.2.3`

## テスト項目

### モデル

- 全カラムの値を指定してるとき、レコードが作成されること

- emailを指定していないとき、エラーになること

- passwordを指定していないとき、エラーになること

- すでに保存されているemailを指定したとき、エラーになること

### コントローラ

- ユーザー情報保存処理

  - ユーザーが登録できること

    - response.body["status"] = "success"

    - response.body["data"]["id"] = 登録しユーザーid

    - response.body["data"]["email"] = 登録したユーザーemail

    - response.status = 200

- ログイン処理
  - email、passwordが正しいとき、ログインできること
    - response.headers["uid"]が存在する

    - response.headers["access-token"]が存在する

    - response.headers["client"]が存在する

    - response.status = 200

  - emailが正しくない場合、ログインできないこと

    - response.body["success"] = false

    - response.body["errors"]が想定したエラー文と等しい

    - response.headers["uid"]が空

    - response.headers["access-token"]が空

    - response.headers["client"]が空

    - response.status = 401

  - passwordが正しくない場合、ログインできないこと

    - response.body["success"] = false

    - response.body["errors"]が想定したエラー文と等しい

    - response.headers["uid"]が空

    - response.headers["access-token"]が空

    - response.headers["client"]が空

    - response.status = 401

- ログアウト処理

  - ログインしているとき、ログアウトできること

    - response.body["success"] = true
    - response.status = 200