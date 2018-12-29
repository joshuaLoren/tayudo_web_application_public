class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :site
      t.string :url
      t.datetime :fecha_inicio
      t.datetime :ultima_revision
      t.string :macro_categoria
      t.string :id_padre
      t.string :nombre
      t.integer :precio
      t.string :img
      t.integer :id_referencia
      t.integer :disponibilidad
      t.datetime :fecha_scrape_update
      t.string :descr
      t.string :atc
      t.string :generic

      t.timestamps
    end
  end
end
