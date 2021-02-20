# frozen_string_literal: true

require 'multilingual'

module Multilingual
  require 'rails'

  class Railtie < Rails::Railtie
    initializer 'multilingual.insert_into_active_record' do
      ActiveSupport.on_load :active_record do
        Multilingual::Railtie.insert
      end
    end

    def self.insert
      ActiveRecord::Base.include Multilingual::Glue if defined?(ActiveRecord)
    end
  end
end
