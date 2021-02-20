require 'multilingual'

module Multilingual
  require 'rails'

  class Railtie < Rails::Railtie
    initializer 'multilingual.insert_into_active_record' do |app|
      ActiveSupport.on_load :active_record do
        Multilingual::Railtie.insert
      end
    end

    def self.insert
      if defined?(ActiveRecord)
        ActiveRecord::Base.send(:include, Multilingual::Glue)
      end
    end
  end
end
