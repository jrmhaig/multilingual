module Multilingual
  class Translation < ApplicationRecord
    belongs_to :multilingual_string, class_name: 'Multilingual::String'
  end
end
