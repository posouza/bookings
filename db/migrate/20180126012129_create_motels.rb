class CreateMotels < ActiveRecord::Migration[5.0]
  def change
    create_table :motels do |t|
      t.integer :user_id
      t.integer :code

      t.timestamps
    end
  end
end
