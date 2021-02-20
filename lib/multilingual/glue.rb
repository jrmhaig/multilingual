# frozen_string_literal: true

require 'multilingual/class_methods'

module Multilingual
  module Glue
    def self.included(base)
      base.extend ClassMethods
    end
  end
end
