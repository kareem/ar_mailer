require 'test/unit'
require 'rubygems'
require 'active_support'
require 'active_support/core_ext/class/attribute_accessors' # d: why need to require?
require 'active_support/core_ext/string/inflections' # d: why need to require?
require 'test/resources/action_mailer'
require 'minitest/autorun'
require 'mocha'

require 'ar_mailer/active_record'
require 'ar_mailer/ar_sendmail'
