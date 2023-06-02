require 'rails_helper'

RSpec.describe "Feature Flags" do
 context "destroy a car" do
  it 'when feature flag is disabled' do
    Flipper.disable(:destroy)
    Car.create!(make: "Ford", model: "Ká", color: "Red", year: "2023", price: "R$ 30.000,00")
    visit cars_path
    click_on "Show this car"
    expect(page).not_to have_button("Destroy this car")
  end

  it 'when feature flag is enabled' do
    Flipper.enable(:destroy)
    Car.create!(make: "Ford", model: "Ká", color: "Red", year: "2023", price: "R$ 30.000,00")
    visit cars_path
    click_on "Show this car"
    expect(page).to have_button("Destroy this car")
  end
 end

 context "edit a car" do
  it 'when feature flag is disabled' do
    Flipper.disable(:edit)
    Car.create!(make: "Ford", model: "Ká", color: "Red", year: "2023", price: "R$ 30.000,00")
    visit cars_path
    click_on "Show this car"
    click_on "Edit this car"
    expect(page).to have_link("Edit this car")
  end

  it 'when feature flag is enabled' do
    Flipper.enable(:edit)
    Car.create!(make: "Ford", model: "Ká", color: "Red", year: "2023", price: "R$ 30.000,00")
    visit cars_path
    click_on "Show this car"
    click_on "Edit this car"
    expect(page).not_to have_link("Edit this car")
  end
 end
end