class CreateEstoques < ActiveRecord::Migration[8.0]
  def change
    create_table :estoques do |t|
      t.integer :id_produto
      t.integer :quantidade_disponivel
      t.date :data_reposicao

      t.timestamps
    end
  end
end
