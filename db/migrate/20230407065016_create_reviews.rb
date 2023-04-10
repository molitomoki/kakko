class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :total,           null: false
      t.integer :concept,         null: false
      t.integer :quality,         null: false
      t.integer :usability,       null: false
      t.integer :utility,         null: false
      t.text    :text,            null: false
      t.references :post,         null: false, foreign_key: true
      t.references :user,         null: false, foreign_key: true 

      t.timestamps
    end
  end
end
