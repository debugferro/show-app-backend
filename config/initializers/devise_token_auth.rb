# frozen_string_literal: true

DeviseTokenAuth.setup do |config|
  config.cookie_enabled = true
  config.cookie_name = 'auth'
  config.cookie_attributes = { httponly: true }

  config.token_lifespan = 1.week
  config.batch_request_buffer_throttle = 30.seconds

  config.token_cost = Rails.env.test? ? 4 : 10
end
