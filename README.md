# Multilingual
Short description and motivation.
This gem adds multilingual support to string fields in Active Record. This
allows for the string to be displayed according to the desired locale.

## Usage

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'multilingual', git: 'https://github.com/jrmhaig/multilingual'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install multilingual
```

Then add this line to your `config/application.rb` file:

```ruby
require 'multilingual/railtie'
```

## Use

To add a multilingual to a model use:

```ruby
class MyModel
  has_multilingual :title
end
```

To create an instance with translations:

```ruby
my_model = MyModel.new(
  title: {
    en: 'Text in English',
    fr: 'Texte en français',
    cy: 'Testun yn Gymraeg'
  }
)
```

To fetch the multilingual string in the desired locale:

```ruby
my_model.title.to_s(:en)
my_model.title.to_s(:fr)
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
