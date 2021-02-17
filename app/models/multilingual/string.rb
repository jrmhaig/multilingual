module Multilingual
  class String < ApplicationRecord
    belongs_to :record, polymorphic: true
    has_many :multilingual_translations,
             class_name: 'Multilingual::Translation',
             foreign_key: :multilingual_string_id

    def to_s locale = 'en'
      multilingual_translations.select { |t| t.locale == locale.to_s }.first.text
    end
  end
end
