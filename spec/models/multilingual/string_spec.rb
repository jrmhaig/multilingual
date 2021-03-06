# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Multilingual::String, type: :model do
  let(:english) { 'The quick brown fox' }
  let(:french) { 'Le renard brun rapide' }

  it { is_expected.to have_many :multilingual_translations }
  it { is_expected.to accept_nested_attributes_for :multilingual_translations }

  describe '#to_s' do
    context 'when there are no translations' do
      subject(:string) { described_class.new(record: Record.new) }

      it 'is nil' do
        expect(string.to_s(:en)).to be_nil
      end
    end

    context 'with translations' do
      subject(:string) do
        described_class.new(
          record: Record.new,
          multilingual_translations_attributes: [
            { locale: 'en', text: english },
            { locale: 'fr', text: french }
          ]
        )
      end

      it 'returns the English by default' do
        # TODO: Make this configurable
        expect(string.to_s).to eq english
      end

      it 'returns a known translation for a locale (by string)' do
        expect(string.to_s('fr')).to eq french
      end

      it 'returns a known translation for a locale (by symbol)' do
        expect(string.to_s(:fr)).to eq french
      end
    end
  end

  describe '#to_h' do
    subject(:string) do
      described_class.new(
        record: Record.new,
        multilingual_translations_attributes: [
          { locale: 'en', text: english },
          { locale: 'fr', text: french }
        ]
      )
    end

    it 'converts to a hash' do
      expect(string.to_h).to eq(
        {
          en: english,
          fr: french
        }.with_indifferent_access
      )
    end

    it 'selects locales' do
      expect(string.to_h(:fr)).to eq(
        {
          fr: french
        }.with_indifferent_access
      )
    end

    it 'allows for an unknown locale' do
      expect(string.to_h(:fr, :it)).to eq(
        { fr: french }.with_indifferent_access
      )
    end
  end

  describe '#translate' do
    subject(:string) { described_class.new(record: Record.new) }

    it 'adds a new translation' do
      expect { string.translate(en: english) }.to change(Multilingual::Translation, :count).by 1
    end

    it 'attaches the new translation to the string' do
      string.translate(en: english)
      expect(string.to_s(:en)).to eq english
    end

    it 'adds multiple translations' do
      expect { string.translate(en: english, fr: french) }
        .to change(Multilingual::Translation, :count).by 2
    end
  end
end
