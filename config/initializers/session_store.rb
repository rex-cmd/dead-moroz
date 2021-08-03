if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_dead-moroz-2', domain: 'dead-moroz-2'
else
  Rails.application.config.session_store :cookie_store, key: '_dead-moroz-2'
end