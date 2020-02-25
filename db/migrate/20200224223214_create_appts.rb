class CreateAppts < ActiveRecord::Migration[6.0]
  def change
    create_table :appts do |t|
      t.string :day
      t.string :role
      t.belongs_to :patient, null: false, foreign_key: true
      t.belongs_to :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
