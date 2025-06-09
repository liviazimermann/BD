json.extract! produto, :id, :nome, :preco_unitario, :created_at, :updated_at
json.url produto_url(produto, format: :json)
