require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Should visit the home page and click 'Add to Cart' " do
  # ACT
  visit root_path
  first('a.btn.btn-primary').click
  expect(page).to have_content('My Cart (1)')
  # DEBUG / VERIFY
  save_screenshot
  puts page.html
  end
end
