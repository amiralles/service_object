# frozen_string_literal: true

require_relative "service_object/version"
require_relative "service_object/safe_call"

module ServiceObject
  # Base is a subclass of SafeCall that provides class-level call methods
  # for convenience.
  #
  # This class adds two class-level methods, `call` and `call!`, which
  # instantiate a new instance of the service object and execute the
  # service logic.
  #
  # @example Subclassing Base
  #   class MyService < Base
  #     def initialize(args)
  #       super
  #     end
  #
  #     protected
  #
  #     def perform_call
  #       # Define the service logic here
  #       puts "Performing call with #{@args}"
  #       "Success result"
  #     end
  #   end
  #
  #   # Usage
  #   result = MyService.call("some arguments")
  #   if result.success?
  #     puts "Success: #{result.value}"
  #   else
  #     puts "Error: #{result.error.message}"
  #   end
  #
  #   # For a bang (!) call
  #   begin
  #     result = MyService.call!("some arguments")
  #     puts "Success: #{result}"
  #   rescue StandardError => e
  #     puts "Error: #{e.message}"
  #   end
  #
  # @see SafeCall
  class Base < SafeCall
    def initialize(args = nil)
      super
    end

    # Class-level method to execute the service logic safely.
    #
    # @param args [Object] the arguments to be used by the service object
    # @param block [Proc] an optional block to be passed to the service object
    # @return [Struct] a result object with `success?` and either `value` or `error`
    def self.call(*args, &block)
      new(*args, &block).call
    end

    # Class-level method to execute the service logic and raise errors.
    #
    # @param args [Object] the arguments to be used by the service object
    # @param block [Proc] an optional block to be passed to the service object
    # @return [Object] the result of the service logic
    # @raise [StandardError] if an error occurs during the service execution
    def self.call!(*args, &block)
      new(*args, &block).call!
    end
  end
end
