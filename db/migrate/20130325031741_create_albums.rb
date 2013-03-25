class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.timestamp :post_date

      t.timestamps
    end
  end
end
