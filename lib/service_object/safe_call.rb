# frozen_string_literal: true

require_relative "bang_call"

module ServiceObject
  # SafeCall is a subclass of BangCall that adds error handling to
  # the service object call.
  #
  # This class overrides the `call` method to safely execute the service logic,
  # returning a result object that indicates success or failure.
  #
  # @example Subclassing SafeCall
  #   class MySafeService < SafeCall
  #     def initialize(args)
  #       super
  #     end
  #
  #     protected
  #
  #     def perform_call
  #       # Define the service logic here
  #       puts "Performing safe call with #{@args}"
  #       "Success result"
  #     end
  #   end
  #
  #   # Usage
  #   service = MySafeService.new("some arguments")
  #   result = service.call
  #   if result.success?
  #     puts "Success: #{result.value}"
  #   else
  #     puts "Error: #{result.error.message}"
  #   end
  #
  # @see BangCall
  class SafeCall < BangCall
    # Executes the service logic safely, capturing any errors.
    #
    # @return [Struct] a result object with `success?` and either `value` or `error`
    def call
      result = call!
      Struct.new(:success?, :value).new(true, result)
    rescue StandardError => e
      Struct.new(:success?, :error).new(false, e)
    end
  end
end
