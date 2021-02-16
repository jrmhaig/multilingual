class CreateMultilingualStrings < ActiveRecord::Migration[6.1]
  def change
    create_table :multilingual_strings do |t|
      t.references :record, polymorphic: true, null: false
      t.string :name

      t.timestamps
    end
  end
end
