class DeprecatedError < StandardError; end

#
# Deprecated is a module to help you deprecate code BEFORE you remove it. Don't
# surprise your users, deprecate them!
#
# Usage is simple:
#
#     class Foo
#       include Deprecated
#
#       def moo
#         "cow"
#       end
#
#       deprecated :moo
#
#       def sheep
#         "baaa"
#       end
#
#       deprecated :sheep, "Sounds#baa"
#
#       protected
#
#       def bar
#         true
#       end
#
#       deprecated :bar
#     end
#     
#     Foo.new.moo # warns that the call is deprecated
#     
#     Deprecated.set_action(:raise)
#     Foo.new.moo # raises with the same message
#
#     Deprecated.set_action do |klass, sym, replacement|
#       email_boss(
#         "Someone tried to use #{klass}##{sym}! " +
#         "They should be using #{replacement} instead!"
#       )
#     end
#
#     Foo.new.sheep # do I really need to explain?
#
#     Foo.new.bar # still protected!
#
# Let's do it live!
#
#     class Bar
#       include Deprecated
#
#       # sets it just for this class
#       deprecated_set_action do |klass, sym, replacement|
#         email_boss(
#           "Someone tried to use #{klass}##{sym}! " +
#           "They should be using #{replacement} instead!"
#         )
#       end
#
#       def cow
#         "moo"
#       end
#
#       deprecate :cow # emails your boss when called!
#     end
#
# Please see Deprecated::Module#deprecated, Deprecated.set_action, and
# Deprecated::Module#deprecated_set_action for more information.
#
module Deprecated
  VERSION = "3.0.1"

  def __deprecated_run_action__(sym, replacement)
    if self.class.instance_eval { @__deprecated_run_action__ }
      self.class.instance_eval { @__deprecated_run_action__ }.call(self.class, sym, replacement) 
    else
      Deprecated.run_action(self.class, sym, replacement)
    end
  end

  def self.build_message(klass, sym, replacement)
    message = "#{klass}##{sym} is deprecated."

    if replacement
      message += " Please use #{replacement}."
    end

    return message
  end

  #
  # set_action takes 3 "canned" arguments or an arbitrary block. If you
  # provide the block, any canned argument is ignored.
  #
  # The canned arguments are:
  #
  # :warn:: display a warning
  # :raise:: raise a DeprecatedError (a kind of StandardError) with the warning.
  # :fail:: fail. die. kaput. it's over.
  #
  # Procs take three arguments:
  #
  # - The class of the method
  # - The method name itself, a symbol
  # - A replacement string which may be nil
  #
  def self.set_action(type=nil, &block)
    @action = if block
                block
              else
                case type
                when :warn
                  proc { |*args| warn build_message(*args) }
                when :fail
                  proc { |*args| fail build_message(*args) }
                when :raise
                  proc { |*args| raise DeprecatedError, build_message(*args) }
                else
                  raise ArgumentError, "you must provide a symbol or a block to set_action()."
                end
              end
  end

  # 
  # Is called when an action needs to be run. Proably not in your best
  # interest to run this directly.
  #
  def self.run_action(klass, sym, replacement)
    raise "run_action has no associated hook" unless @action
    @action.call(klass, sym, replacement)
  end

  #
  # Returns the current action; this may be block or Proc.
  #
  def self.action
    @action
  end
end

module Deprecated
  module Module

    #
    # deprecated takes up to three arguments:
    #
    # - A symbol which is the name of the method you wish to deprecate
    #   (required)
    # - A string or symbol which is the replacement method. If you provide
    #   this, your users will be instructed to use that method instead.
    # - A symbol of :public, :private, or :protected which determines the
    #   new scope of the method. If you do not provide one, it will be
    #   searched for in the various collections, and scope will be chosen
    #   that way.
    # 
    def deprecated(sym, replacement=nil, scope=nil)
      unless sym.kind_of?(Symbol)
        raise ArgumentError, "deprecated() requires symbols for its first argument." 
      end

      meth = instance_method(sym)
      unless scope
        pub = public_instance_methods
        pro = protected_instance_methods
        pri = private_instance_methods
        if pub.include?(sym) or pub.include?(sym.to_s)
          scope = :public
        elsif pro.include?(sym) or pro.include?(sym.to_s)
          scope = :protected
        elsif pri.include?(sym) or pri.include?(sym.to_s)
          scope = :private
        end
      end

      define_method(sym) do |*args|
        dep_meth = method(sym).unbind
        __deprecated_run_action__(sym, replacement)
        retval = meth.bind(self).call(*args) 
        dep_meth.bind(self)
        return retval
      end

      method(scope).call(sym) if scope
      return scope
    end

    #
    # Deprecated.set_action for class scope. See Deprecated.set_action.
    #
    def deprecated_set_action(&block)
      raise "You must provide a block" unless block
      @__deprecated_run_action__ = block
    end
  end
    
  def self.included(base)
    base.extend(Module)
  end
end

Deprecated.set_action(:warn)
