class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :title
      t.string :descripcion
      t.integer :tarifa
      t.decimal :tiempo_ejecucion
      t.string :garantia
      t.string :photo
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
