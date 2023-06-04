#APP_CONFIG = YAML.load_file(Rails.root.join('config', 'config.yml'), aliases: true)[Rails.env].with_indifferent_access
APP_CONFIG = YAML.unsafe_load_file(Rails.root.join('config', 'config.yml'))[Rails.env].with_indifferent_access
