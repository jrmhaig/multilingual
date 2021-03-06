# Multilingual
Short description and motivation.
This gem adds multilingual support to string fields in Active Record. This
allows for the string to be displayed according to the desired locale.

[![Build Status](https://travis-ci.org/jrmhaig/multilingual.svg?branch=main)](https://travis-ci.org/jrmhaig/multilingual)

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

Then add this line to your `config/application.rb` file:

```ruby
require 'multilingual/railtie'
```

Copy the database migrations and update:

```bash
bundle exec rails multilingual:install:migrations
bundle exec rails db:migrate
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

## Support

* Ruby 2.6, 2.7 & 3.0
* Rails 6.0 & 6.1

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
