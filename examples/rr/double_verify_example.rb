dir = File.dirname(__FILE__)
require "#{dir}/../example_helper"

module RR
describe Double, "#verify" do
  before do
    @space = Space.new
    @object = Object.new
    @method_name = :foobar
    @object.methods.should_not include(@method_name.to_s)
    @double = @space.create_double(@object, @method_name) {}
  end

  it "verifies each expectation was met" do
    expectation = Expectations::TimesCalledExpectation.new(1)
    @double.add_expectation expectation
    proc {@double.verify}.should raise_error(Expectations::TimesCalledExpectationError)
  end
end
end
