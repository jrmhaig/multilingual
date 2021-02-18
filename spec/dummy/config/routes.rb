# frozen_string_literal: true

Rails.application.routes.draw do
  mount Multilingual::Engine => '/multilingual'
end
