require_relative 'base_command'

module Command
  class Create < BaseCommand
    attr_reader :capacity, :msg

    def initialize(context)
      super(context)

      context_is_not_nil?

      if context.capacity < 1
        raise "capacity cannot be less than 1"
      end
      super(context)
      @capacity = context.capacity
    end

    def execute
      context.parking_lot = ParkingLot.new(capacity)
      return "Created parking lot with #{capacity} slots"
    end
  end
end