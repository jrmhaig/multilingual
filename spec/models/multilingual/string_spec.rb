require 'rails_helper'

module Multilingual
  RSpec.describe String, type: :model do
    # pending "add some examples to (or delete) #{__FILE__}"
    it 'does something' do
      ms = Multilingual::String.new record: Record.new
      tr = Multilingual::Translation.new multilingual_string: ms
      require 'pry'
      binding.pry
    end
  end
end
