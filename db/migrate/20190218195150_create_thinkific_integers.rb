class CreateThinkificIntegers < ActiveRecord::Migration[5.2]
  def change
    create_table :thinkific_integers do |t|
      t.integer :content

      t.timestamps
    end
  end
end
