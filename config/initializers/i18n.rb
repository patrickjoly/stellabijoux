I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
I18n.locale = :fr
I18n.default_locale = :fr
I18n.reload!
