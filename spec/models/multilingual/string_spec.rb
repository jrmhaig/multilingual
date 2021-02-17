require 'rails_helper'

module Multilingual
  RSpec.describe String, type: :model do
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

      let(:english) { 'The quick brown fox' }
      let(:french) { 'Le renard brun rapide' }

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
end
