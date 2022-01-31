require 'rails_helper'
RSpec.describe 'Label function', type: :system do
  let!(:label){ FactoryBot.create(:label) }
  let!(:second_label){ FactoryBot.create(:second_label) }
  let!(:third_label){ FactoryBot.create(:third_label) }
  let!(:user){ FactoryBot.create(:user)}
  let!(:admin_user){ FactoryBot.create(:admin_user)}
  let!(:task){ FactoryBot.create(:task, user_id: user.id) }
  before do
    visit new_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    find('#create_session').click_on 'Login'
  end
  describe 'Label Stringging' do
    let!(:new_task){ FactoryBot.build(:new_task, user_id: user.id) }
    before do
      visit new_task_path
      fill_in 'Task name', with: new_task.task_name
      fill_in 'Description', with: new_task.description
      check 'Label１'
      check 'Label２'
      click_on 'Register'
      
      
    end
    context 'New Task creation ' do
      it 'Show Stringging Label ' do
        expect(page).to have_content "Label１"
        expect(page).to have_content "Label２"
      end
    end
    context 'Task label editing' do
      before do
        visit tasks_path
        first('tbody tr').click_on 'Edit'
        fill_in 'Task name', with: 'Label Edited'
        uncheck 'Label１'
        uncheck 'Label２'
        check 'Label３'
        click_on 'Register'
      end
      it 'Label edited is display' do 
        expect(page).to have_content 'Task Label Edited was successfully updated.'
        expect(page).to have_content 'Label３'
      end
    end
  end
  describe 'Creation label function' do
    before do
      visit new_session_path
      fill_in 'Email', with: admin_user.email
      fill_in 'Password', with: admin_user.password
      find('#create_session').click_on 'Login'
    end
    context 'If a user with administrator privileges creates a label' do
      before do
        visit admin_users_path
        click_on 'New label'
        fill_in 'Label name', with: 'New Label'
        click_on 'Register'
        visit new_task_path
      end
      it 'The label added on the task  creation screen is displayed.' do
        expect(page).to have_content 'New Label'
      end
    end
  end
end