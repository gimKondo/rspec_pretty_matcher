require "bundler"
Bundler.require
require "rspec_pretty_matcher/version"

module RspecPrettyMatcher
  # matcher for constants
  RSpec::Matchers.define :const_eq do |mozule, exp_symbol|
    match do |act_val|
      mozule.const_get(exp_symbol) == act_val
    end
    failure_message do |act_val|
      act_symbol = mozule.constants(true).find { |c| mozule.const_get(c) == act_val }
      act_msg = if act_symbol.nil? then "     got: unknown value (#{act_val})"
                else "     got: #{mozule.name}::#{act_symbol} (#{act_val})"
                end
      exp_val = mozule.const_get(exp_symbol)
      "expected: #{mozule.name}::#{exp_symbol} (#{exp_val})\n" << act_msg
    end
  end
end
