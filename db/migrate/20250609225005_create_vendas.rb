class CreateVendas < ActiveRecord::Migration[8.0]
  def change
    create_table :vendas do |t|
      t.integer :id_cliente
      t.date :data_venda
      t.decimal :valor_total

      t.timestamps
    end
  end
end
