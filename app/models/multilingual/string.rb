# frozen_string_literal: true

module Multilingual
  class String < ApplicationRecord
    belongs_to :record, polymorphic: true
    has_many :multilingual_translations,
             class_name: 'Multilingual::Translation',
             foreign_key: :multilingual_string_id,
             dependent: :destroy,
             inverse_of: :multilingual_string
    accepts_nested_attributes_for :multilingual_translations

    def to_s(locale = 'en')
      multilingual_translations.select { |t| t.locale == locale.to_s }.first&.text
    end

    def to_h(*locales)
      multilingual_translations
        .map { |t| [t.locale.to_sym, t.text] }
        .select { |t| locales.empty? || locales.include?(t[0]) }
        .to_h
        .with_indifferent_access
    end

    def translate(translations = {})
      translations.each_pair do |locale, text|
        multilingual_translations << Multilingual::Translation.new(
          locale: locale,
          text: text,
          multilingual_string: self
        )
      end
      save
    end
  end
end
