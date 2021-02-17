require 'rails_helper'

RSpec.describe Record do
  # Record is defined in spec/support/record.rb
  # `title` is a multilingual column
  describe '#title' do
    subject(:title) { Record.new.title }
    it { is_expected.to be_a Multilingual::String }
  end
end
