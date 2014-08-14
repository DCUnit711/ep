#!/usr/bin/env ruby

require 'rubygems'
gem 'test-unit'
require 'test/unit'
$:.unshift 'lib'
require 'deprecated.rb'
$:.shift

# this class is used to test the deprecate functionality
class DummyClass
  include Deprecated

  def monkey
    return true
  end

  def monkey_bars
    return true
  end

  deprecated :monkey
  deprecated :monkey_bars, "FooClass#fart"

  protected

  def my_protected 
    return true
  end

  deprecated :my_protected

  private

  def my_private
    return true
  end

  deprecated :my_private
end

class DummyClass2
  include Deprecated

  deprecated_set_action do |klass, sym, replacement|
    raise DeprecatedError, "foo!"
  end

  def monkey
    return true
  end

  deprecated :monkey
end

# we want exceptions for testing here.
Deprecated.set_action(:raise)

class DeprecateTest < Test::Unit::TestCase
  def test_set_action
    assert_raises(DeprecatedError) { DummyClass.new.monkey }

    Deprecated.set_action { |klass, sym| raise DeprecatedError.new("#{klass}##{sym} is deprecated.") }
    assert_raises(DeprecatedError.new("DummyClass#monkey is deprecated.")) do 
      DummyClass.new.monkey 
    end

    Deprecated.set_action(:raise)

    assert_raises(DeprecatedError.new("DummyClass#monkey is deprecated.")) do 
      DummyClass.new.monkey 
    end

    # set to warn and make sure our return values are getting through.
    Deprecated.set_action(:warn)
    assert(DummyClass.new.monkey)

    Kernel.module_eval { 
      def self.fail
        raise "failed"
      end
    }

    Deprecated.set_action(:fail)

    assert_raises("failed") { DummyClass.new.monkey }
  end

  def test_scope
    assert(
      DummyClass.public_instance_methods.include?(:monkey) ||
      DummyClass.public_instance_methods.include?("monkey")
    )
    assert(
      DummyClass.protected_instance_methods.include?(:my_protected) ||
      DummyClass.protected_instance_methods.include?("my_protected")
    )
    assert(
      DummyClass.private_instance_methods.include?(:my_private) ||
      DummyClass.private_instance_methods.include?("my_private")
    )
  end

  def test_scoped_actions
    assert_raises(DeprecatedError.new("foo!")) { DummyClass2.new.monkey }
  end

  def test_replacement
    Deprecated.set_action(:raise)

    assert_raises(DeprecatedError.new("DummyClass#monkey_bars is deprecated. Please use FooClass#fart.")) do 
      DummyClass.new.monkey_bars
    end
  end
end
