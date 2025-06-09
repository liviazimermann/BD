json.extract! estoque, :id, :id_produto, :quantidade_disponivel, :data_reposicao, :created_at, :updated_at
json.url estoque_url(estoque, format: :json)
