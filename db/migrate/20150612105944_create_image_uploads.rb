class CreateImageUploads < ActiveRecord::Migration
  def change
    create_table :image_uploads do |t|
      t.string :filename
      t.interger :user_id
      t.string :timestamp

      t.timestamps null: false
    end
  end
end
