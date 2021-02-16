module Multilingual
  class Engine < ::Rails::Engine
    isolate_namespace Multilingual

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
