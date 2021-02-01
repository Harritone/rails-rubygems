  require 'json'
  aws_credentials = Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_ACCESS_KEY_ID'])
  Aws.add_action_mailer_delivery_method(:aws_ses, credentials: aws_credentials, region: ENV['AWS_REGION'])
