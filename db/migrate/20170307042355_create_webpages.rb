class CreateWebpages < ActiveRecord::Migration[5.0]
  def change
    create_table :webpages do |t|
      t.string :name
      t.string :url
      t.string :text
      t.references :collection, foreign_key: true

      t.timestamps
    end
  end
end
