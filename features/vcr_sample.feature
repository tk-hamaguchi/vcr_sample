# language: ja

機能: VCRによるAPIリクエストのスタブ化


シナリオ: POSTリクエスト
  もし 下記をパラメータにして"/somethings"に"POST"リクエストを実行する:
    """
    hoge:
      fuga: 'FUGA'
    """
  ならば ステータスコード"201"と共に下記のレスポンスボディが返送される:
    """
    {"hoge":{"id":1234,"fuga":"GAHAHAHA!"}}
    """
