# Generated via
#  `rails generate hyrax:work Summary`
require 'rails_helper'
include Warden::Test::Helpers

# NOTE: If you generated more than one work, you have to set "js: true"
RSpec.feature 'Test Summary Order', js: false do
  # context 'a logged in user' do
  #   let(:user_attributes) do
  #     { email: 'test@example.com' }
  #   end
  #   let(:user) do
  #     User.new(user_attributes) { |u| u.save(validate: false) }
  #   end
  #
  #   before do
  #     AdminSet.find_or_create_default_admin_set_id
  #     login_as user
  #   end
  #
  #   scenario do
  #     visit '/dashboard'
  #     click_link "Works"
  #     click_link "Add new work"
  #
  #     # add multiple writers
  #
  #     #save summary
  #
  #     #test order of writers
  #   end
  # end
end
