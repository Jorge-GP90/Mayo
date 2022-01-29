require 'rails_helper'
RSpec.describe 'User Managment Function', type: :system do
    let!(:user){ FactoryBot.create(:user)}
    let!(:admin_user){ FactoryBot.create(:admin_user)}
    let!(:second_user){ FactoryBot.create(:second_user)}
    describe 'New user function' do
      let!(:new_user){ FactoryBot.build(:new_user) }
      context 'if you create a new user' do
        before do
          visit new_user_path
          fill_in 'User name', with: new_user.user_name
          fill_in 'Email', with: new_user.email
          fill_in 'Password', with: new_user.password
          fill_in 'Password confirmation', with: new_user.password
          click_on 'Register'
        end
        it 'The user created will be displayed' do
          expect(page).to have_content  "#{new_user.user_name}"
        end
      end
      context 'Users that are not login  can not access' do
        before do
          visit root_path
        end
        it 'The login screen  will be display' do
          expect(page).to have_content 'Login'
        end
      end
    end
    describe 'Session function test' do
      before do
        visit new_session_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        find('#create_session').click_on 'Login'
      end
      context 'Login access' do
        it 'Own profile page will be display ' do
          expect(page).to have_content "#{user.user_name}"
        end
      end
      context 'Own profile page' do
        before do
          visit user_path(user.id)
        end
        it 'Own profile page will be display' do
          expect(page).to have_content "#{user.user_name}"
        end
      end
      context 'General users can not visit other user page' do
        before do
          visit user_path(second_user.id)
        end
        it 'Tasks page will be display' do
          expect(page).to have_content "Tasks"
        end
      end
      context 'Session finish (Log out) ' do
        before do
          click_on 'Logout'
        end
        it 'Login screen will be display' do
          expect(page).to have_content "Login"
        end
      end
    end
    describe 'Managment screen test' do
      before do
        visit new_session_path
        fill_in 'Email', with: admin_user.email
        fill_in 'Password', with: admin_user.password
        find('#create_session').click_on 'Login'
      end
      context 'Admin User has access to the Managment List ' do
        before do
          click_on 'User List'
        end
        it 'User Managment List will be display' do
          expect(page).to have_content "Managment List"
        end
      end
      context 'General users cannot access to managment screen' do
        before do
          visit new_session_path
          fill_in 'Email', with: user.email
          fill_in 'Password', with: user.password
          find('#create_session').click_on 'Login'
          visit admin_users_path
        end
        it 'Can no access to admin user screen' do
            
          expect(page).to have_selector '.alert-warning', text: 'Only administrator users can access'
        end
      end
      context 'Admin User can register Users' do
        let!(:new_user){ FactoryBot.build(:new_user) }
        before do
          visit admin_users_path
          click_on 'New user'
          fill_in 'User name', with: new_user.user_name
          fill_in 'Email', with: new_user.email
          fill_in 'Password', with: new_user.password
          fill_in 'Password Confirmation', with: new_user.password
          check 'Admin'
          click_on 'Register'
        end
        it 'New user account has been created' do
        #   expect(page).to have_selector '.alert-success', text: "User 「#{new_user.user_name}」has been created"
          expect(page).to have_content "Managment details"
        end
      end
      context 'Admin User can acces to Users detail screen ' do
        before do
          visit admin_users_path
          first('tbody tr').click_on 'Show'
        end
        it 'Users profile access' do
          expect(page).to have_content "page"
        end
      end
      context 'Admin Users can edit other Users' do
        before do
          visit admin_users_path
          first('tbody tr').click_on 'Edit'
          fill_in 'User name', with: 'User edited '
          fill_in 'Password', with: second_user.password
          fill_in 'Password confirmation', with: second_user.password
          click_on 'Register'
        end
        it 'User name  on profile has been edited ' do
          expect(page).to have_content "User edited "
        end
      end
      context 'Admin Users can delete users' do
        before do
          visit admin_users_path
          page.accept_confirm do
            first('tbody tr').click_on 'Delete'
          end
        end
        it 'User list return and a danger alert is display' do
          expect(page).to have_selector '.alert-danger', text: "User「#{second_user.user_name}」has been deleted"
        end
      end
    end
  end