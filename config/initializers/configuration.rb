CONFIG = YAML.load_file("#{RAILS_ROOT}/config/configuration.yml")[RAILS_ENV].symbolize_keys

#Configurations for the ExceptionNotifier
ExceptionNotifier.exception_recipients = CONFIG[:admin_email]
ExceptionNotifier.email_prefix = printf("[%s] ", CONFIG[:app_name])
