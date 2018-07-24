require 'rails_helper'

RSpec.feature "Visitor visits product details page", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
  end

  scenario "they see product details" do
    # ACT
    visit root_path
    page.find('footer').find_link('Details').trigger('click')

    # VERIFY
    expect(current_path).to eql '/products/1'
    save_screenshot
    puts page.html
    save_screenshot
  end
end
