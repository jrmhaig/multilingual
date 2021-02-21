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
      define_setter
      define_initializer
      define_argument_modifier
    end

    private

    def define_getters
      define_instance_getter
      define_class_getter
    end

    def define_instance_getter
      name = @name

      @klass.define_method(@name) do |*_args|
        ivar = "@string_#{name}"
        string = instance_variable_get(ivar)

        if string.nil?
          string = Multilingual::String.create_or_find_by(name: name, record: self)
          instance_variable_set(ivar, string)
        end

        string
      end
    end

    def define_class_getter; end

    def define_setter
      name = @name
      @klass.define_method("#{@name}=") do |translations|
        ivar = "@string_#{name}"
        string = instance_variable_get(ivar)

        if string
          # Do something to update
        else
          instance_variable_set(ivar, multilingual_find_or_initialize(name, translations))
        end
      end
    end

    def define_initializer
      @klass.define_method(:multilingual_find_or_initialize) do |name, translations|
        Multilingual::String.find_or_initialize_by(name: name, record: self).tap do |s|
          s.multilingual_translations_attributes = multilingual_translation_attributes(translations)
        end
      end
    end

    def define_argument_modifier
      @klass.define_method(:multilingual_translation_attributes) do |translations|
        translations.each_pair.map { |locale, text| { locale: locale, text: text } }
      end
    end
  end
end
