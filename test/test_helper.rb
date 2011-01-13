require 'test/unit'
require 'rubygems'
require 'active_support'
require 'active_support/core_ext/class/attribute_accessors' # d: why need to require?
require 'active_support/core_ext/string/inflections' # d: why need to require?
require 'test/resources/action_mailer'
require 'minitest/autorun'
require 'mocha'

require 'action_mailer/ar_mailer'
require 'action_mailer/ar_sendmail'
