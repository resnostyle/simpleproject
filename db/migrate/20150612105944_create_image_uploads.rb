class CreateImageUploads < ActiveRecord::Migration
  def change
    create_table :image_uploads do |t|
      t.string :filename
      t.integer :user_id

      t.string :timestamp
    end
  end
end
