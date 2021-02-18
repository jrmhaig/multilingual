# frozen_string_literal: true

require 'multilingual/has_multilingual'

module Multilingual
  module ClassMethods
    def has_multilingual(name, options = {})
      HasMultilingual.new(self, name, options).define
    end
  end
end
