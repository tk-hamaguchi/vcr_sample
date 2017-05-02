When /^下記をパラメータにして"([^"]*)"に"([^"]*)"リクエストを実行する:$/ do |path, method, yaml|
  send(method.downcase.to_sym, path, YAML.load(yaml))
end

Then /^ステータスコード"([^"]*)"と共に下記のレスポンスボディが返送される:$/ do |status, body|
  expect(last_response.body.strip).to eq body.strip
  expect(last_response.status).to eq status.to_i
end

