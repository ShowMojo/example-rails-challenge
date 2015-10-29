require 'rubygems'

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.raise_errors_for_deprecations!

  config.order = :random

  Kernel.srand config.seed
end
