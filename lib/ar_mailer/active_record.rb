##
# Adds sending email through an ActiveRecord table as a delivery method for
# ActionMailer.
#
module ArMailer
  class ActiveRecord

    ##
    # Set the email class for deliveries. Handle class reloading issues which prevents caching the email class.
    #
    @@email_class_name = 'Email'

    def self.email_class=(klass)
      @@email_class_name = klass.to_s
    end

    def self.email_class
      @@email_class_name.constantize
    end

    ##
    # Adds +mail+ to the Email table.  Only the first From address for +mail+ is
    # used.

    def deliver!(mail)
      destinations = mail.destinations
      sender = (mail['return-path'] && mail['return-path'].spec) || mail.from.first
      destinations.each do |destination|
        (mail.email_class || self.class.email_class).create :mail => mail.encoded, :to => destination, :from => sender
      end
    end

  end

  module EmailClassAttribute
    attr_accessor :email_class
  end
end

ActionMailer::Base.add_delivery_method :activerecord, ArMailer::ActiveRecord
ActionMailer::Base.delivery_method = :activerecord
Mail::Message.send :include, ArMailer::EmailClassAttribute

