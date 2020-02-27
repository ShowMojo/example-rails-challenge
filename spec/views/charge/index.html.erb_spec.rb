require "rails_helper"

RSpec.describe "charges/index" do
    it "displays 3 types charges" do
        render

        expect(rendered).to match /failed charges/
        expect(rendered).to match /disputed charges/
        expect(rendered).to match /successful charges/
    end
end