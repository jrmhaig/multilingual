# frozen_string_literal: true

appraise 'rails-6.0' do
  gem 'rails', '~> 6.0'
end

appraise 'rails-6.1' do
  gem 'rails', '~> 6.1'
end

appraise 'rails-head' do
  git 'https://github.com/rails/rails.git', branch: 'main' do
    gem 'rails'
  end
end
