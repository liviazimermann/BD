json.extract! venda_produto, :id, :id_venda, :id_produto, :quantidade, :preco_unitario, :created_at, :updated_at
json.url venda_produto_url(venda_produto, format: :json)
