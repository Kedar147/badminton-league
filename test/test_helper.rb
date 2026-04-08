ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

if Gem.loaded_specs["minitest"]&.version&.segments&.first.to_i >= 6
  module Rails
    module LineFiltering
      # Rails 7.1 expects the older class-level Minitest#run signature.
      # Minitest 6 calls this hook as `run(klass, method_name, reporter)`.
      def run(*args, **kwargs)
        return super(*args, **kwargs) unless args.length <= 2

        reporter = args[0]
        options = args[1] || {}
        options = options.merge(filter: Rails::TestUnit::Runner.compose_filter(self, options[:filter]))

        super(reporter, options, **kwargs)
      end
    end
  end
end

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
