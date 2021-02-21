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

  describe '#title' do
    subject(:title) { described_class.new.title }

    it { is_expected.to be_a Multilingual::String }

    it 'has a valid multilingual string' do
      expect(title).to be_valid
    end
  end
end
