# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Record do
  # Record is defined in spec/support/record.rb
  # `title` is a multilingual column
  describe '.new' do
    it 'can create without a multilingual value' do
      expect(described_class.new).to be_valid
    end

    context 'with translation options' do
      subject(:record) { described_class.new(title: { it: italian, en: english }) }

      let(:italian) { 'Divina Commedia' }
      let(:english) { 'Devine Comedy' }

      it { is_expected.to be_valid }

      it 'sets the translation correclty' do
        expect(record.title.to_s(:en)).to eq english
      end
    end
  end

  describe '.create' do
    context 'with translation options' do
      subject(:record) { described_class.create(title: { it: italian, en: english }) }

      let(:italian) { 'Divina Commedia' }
      let(:english) { 'Devine Comedy' }

      it 'creates a Multilingual::String' do
        expect { record }.to change(Multilingual::String, :count).by 1
      end

      it 'creates the correct number of Multilingual::Translations' do
        expect { record }.to change(Multilingual::Translation, :count).by 2
      end
    end

    context 'without translation options' do
      subject(:record) { described_class.create }

      it 'creates a Multilingual::String' do
        expect { record }.to change(Multilingual::String, :count).by 1
      end

      it 'does not create any Multilingual::Translations' do
        expect { record }.not_to change(Multilingual::Translation, :count)
      end
    end
  end

  describe '#title' do
    subject(:title) { described_class.new.title }

    it { is_expected.to be_a Multilingual::String }

    it 'has a valid multilingual string' do
      expect(title).to be_valid
    end
  end
end
