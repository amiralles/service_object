# frozen_string_literal: true

class SuccessService < ServiceObject::Base
  def perform_call
    args
  end
end

class FailureService < ServiceObject::Base
  def perform_call
    raise(StandardError, "Oops :/")
  end
end

RSpec.describe ServiceObject do
  it "has a version number" do
    expect(ServiceObject::VERSION).not_to be_nil
  end

  describe "&safe_call/0" do
    context "when call succeeds" do
      it "returns a success/result tuple" do
        return_value = %i[foo bar baz].sample

        result = SuccessService.call(return_value)

        expect(result.success?).to be(true)
        expect(result.value).to eq(return_value)
      end
    end

    context "when call fails" do
      it "returns an error tuple" do
        result = FailureService.call

        expect(result.success?).to be(false)
        expect(result.error.message).to eq("Oops :/")
      end
    end
  end

  describe "&call/0" do
    context "when call succeeds" do
      it "returns the service call result" do
        result = %i[foo bar baz].sample

        expect(SuccessService.call!(result)).to eq(result)
      end
    end

    context "when call fails" do
      it "raises an error" do
        expect { FailureService.call! }.to raise_error(StandardError, "Oops :/")
      end
    end
  end
end
