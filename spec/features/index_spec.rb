require 'spec_helper'

describe 'the index page', type: :feature, js: true do
  before { visit '/index.html' }
  it 'is the index page' do
    by 'being the index page' do
      expect(current_path).to eq '/index.html'
    end  
    and_by 'having the index page heading' do
      expect(page).to have_text I18n.t('index.headings.page')
    end
  end
end