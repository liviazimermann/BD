class CreateProdutos < ActiveRecord::Migration[8.0]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.decimal :preco_unitario

      t.timestamps
    end
  end
end
