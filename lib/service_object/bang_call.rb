# frozen_string_literal: true

module ServiceObject
  # BangCall is a base class for service objects that require a bang (!)
  # method to perform an action.
  #
  # Subclasses should implement the `perform_call` method to define the
  # actual service logic.
  #
  # @example Subclassing BangCall
  #   class MyService < BangCall
  #     def initialize(args)
  #       super
  #     end
  #
  #     protected
  #
  #     def perform_call
  #       # Define the service logic here
  #       puts "Performing call with #{@args}"
  #     end
  #   end
  #
  #   # Usage
  #   service = MyService.new("some arguments")
  #   service.call!
  #
  # @abstract Subclass and override {#perform_call} to implement
  # the service logic.
  class BangCall
    attr_reader :args

    # Initializes a new instance of the service object.
    #
    # @param args [Object] the arguments to be used by the service object
    def initialize(args = nil)
      @args = args
    end

    # Executes the service logic defined in {#perform_call}.
    # @raise [RuntimeError] if {#perform_call} is not implemented by the subclass
    def call!
      perform_call
    end

    protected

    # Performs the actual service logic.
    #
    # Subclasses must implement this method.
    #
    # @return [void]
    # @raise [RuntimeError] if the method is not implemented by the subclass
    def perform_call
      raise "Service objects must implement &perform_call/0"
    end
  end
end
