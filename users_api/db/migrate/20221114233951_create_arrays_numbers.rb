class CreateArraysNumbers < ActiveRecord::Migration[6.0]
  def change
    create_table :arrays_numbers do |t|
      t.string :array

      t.timestamps
    end
  end
end