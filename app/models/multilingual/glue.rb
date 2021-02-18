# frozen_string_literal: true

module Multilingual
  module Glue
    def self.included(base)
      base.extend ClassMethods
    end
  end
end
