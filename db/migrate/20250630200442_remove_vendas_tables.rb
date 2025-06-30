class RemoveVendasTables < ActiveRecord::Migration[8.0]
  def change
    drop_table :venda_produtos
    drop_table :vendas
  end
end
