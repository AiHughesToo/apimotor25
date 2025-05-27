class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :note
      t.boolean :taken
      t.boolean :user_complete
      t.boolean :rider_complete
      t.references :user, null: false, foreign_key: true
      t.integer :rider_id
      t.float :latitude
      t.float :longitude
      t.float :rider_lat
      t.float :rider_long
      t.string :rider_name

      t.timestamps
    end
  end
end
