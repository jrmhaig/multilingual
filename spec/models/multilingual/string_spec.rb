require 'rails_helper'

RSpec.describe Multilingual::String, type: :model do
  let(:english) { 'The quick brown fox' }
  let(:french) { 'Le renard brun rapide' }

  it { should have_many :multilingual_translations }

  describe '#to_s' do
    subject(:string) do
      described_class.new(
        record: Record.new,
        multilingual_translations: [
          Multilingual::Translation.new(locale: 'en', text: english),
          Multilingual::Translation.new(locale: 'fr', text: french),
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
