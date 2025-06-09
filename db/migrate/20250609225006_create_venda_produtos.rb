class CreateVendaProdutos < ActiveRecord::Migration[8.0]
  def change
    create_table :venda_produtos do |t|
      t.integer :id_venda
      t.integer :id_produto
      t.integer :quantidade
      t.decimal :preco_unitario

      t.timestamps
    end
  end
end
