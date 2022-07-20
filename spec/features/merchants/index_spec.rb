require 'rails_helper'

RSpec.describe 'Merchants index page' do
  it 'Returns a list of merchant links' do
    visit '/merchants'

    expect(page).to have_link('Klein, Rempel and Jones')

    expect(page).to have_link('Williamson Group')

    click_on('Schroeder-Jerde')

    expect(current_path).to eq('/merchants/1')

    expect(page).to have_content('Item Nemo Facere')

    expect(page).to have_content('Item Expedita Aliquam')
  end
end
