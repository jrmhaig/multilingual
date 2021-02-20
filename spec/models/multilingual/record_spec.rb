# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Record do
  # Record is defined in spec/support/record.rb
  # `title` is a multilingual column
  describe '#title' do
    subject(:title) { described_class.new.title }

    it { is_expected.to be_a Multilingual::String }

    it 'has a valid multilingual string' do
      expect(title).to be_valid
    end
  end
end
