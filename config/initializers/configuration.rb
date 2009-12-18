APP_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/rtg_configuration.yml")[RAILS_ENV].symbolize_keys

#Configurations for the ExceptionNotifier
ExceptionNotifier.exception_recipients = APP_CONFIG[:admin_email]
ExceptionNotifier.email_prefix = printf("[%s] ", APP_CONFIG[:app_name])
