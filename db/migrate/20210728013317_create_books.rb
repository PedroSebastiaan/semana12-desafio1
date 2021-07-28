class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :status
      t.datetime :lending_date
      t.datetime :return_date

      t.timestamps
    end
  end
end
