module Multilingual
  class String < ApplicationRecord
    belongs_to :record, polymorphic: true
  end
end
