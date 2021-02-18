# frozen_string_literal: true

module Multilingual
  class HasMultilingual
    def initialize(klass, name, options)
      @klass = klass
      @name = name
      @options = options
    end

    def define
      define_getters
      define_setters
    end

    private

    def define_getters
      define_instance_getter
      define_class_getter
    end

    def define_instance_getter
      @klass.send :define_method, @name do |*args|
        Multilingual::String.new(*args)
      end
    end

    def define_class_getter; end

    def define_setters; end
  end
end
