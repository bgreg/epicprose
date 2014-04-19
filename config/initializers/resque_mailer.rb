Resque::Mailer.excluded_environments = [:test]
class AsyncMailer < ActionMailer::Base
  include Resque::Mailer
end
