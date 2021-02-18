# frozen_string_literal: true

class CreateMultilingualTranslations < ActiveRecord::Migration[6.1]
  def change
    create_table :multilingual_translations do |t|
      t.references :multilingual_string, null: false, foreign_key: true
      t.string :locale
      t.string :text

      t.timestamps
    end
  end
end
