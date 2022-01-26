require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do 
    #SETUP
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
  
    scenario 'verify the cart increases by one after clicking Add to Cart button for a product on the home page' do
      # ACT
      visit root_path
      expect(page).to have_content('My Cart (0)')
      click_on("Add")
      
      # DEBUG / VERIFY
      save_screenshot
      expect(page).to have_content('My Cart (1)')
    end
  
  end