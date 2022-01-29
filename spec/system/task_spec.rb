require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
  let!(:user){ FactoryBot.create(:user)}
  let!(:admin_user){ FactoryBot.create(:admin_user)}
  let!(:second_user){ FactoryBot.create(:second_user)}

  let!(:longest_task){ FactoryBot.create(:longest_task, user_id: user.id)}
  let!(:task){ FactoryBot.create(:task, user_id: user.id) }
  let!(:second_task){ FactoryBot.create(:second_task, user_id: user.id) }
  let!(:latest_task){ FactoryBot.create(:latest_task, user_id: user.id)}

  before do
    visit new_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    find('#create_session').click_on 'Login' 
  end
  describe 'New creation function' do
    let!(:new_task){ FactoryBot.build(:new_task, user_id: user.id) }
     before do
       visit new_task_path
       fill_in 'Task name', with: new_task.task_name
       fill_in 'Description', with: new_task.description
       click_on 'Register'
    end
    context 'When creating a new task' do
      it 'The created task is displayed' do
       expect(page).to have_content 'was successfully created.'
      end
    end
  end
  describe 'List display function' do
    before do
      visit tasks_path
    end
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed' do
        expect(page).to have_content task.task_name
        expect(page).to have_content second_task.description  
      end
    end
    context 'When tasks are arranged in descending order of creation date and time and the longest' do
      before do
        visit tasks_path
        click_on 'Expired_at'
      end
      it'new task is displayed at the top' do  
        tasklist = all('.expired_row') 
        expect(tasklist[0]).to have_content 'December 31, 2022 00:00'
      end
    end
    context 'Order High Priority Task' do
      let!(:high_priority_task){ FactoryBot.create(:high_priority_task, user_id: user.id)}
      before do
      visit tasks_path
      click_on 'Priority'
      end
      it 'Priority task ordered' do
        prioritylist = all('.priority') 
        expect(prioritylist[0]).to have_content 'high' 
      end
    end
  end
  describe 'Search Function' do
    before do
      visit tasks_path
    end
    context 'Fuzzy Search by Task Name' do
      before do
        fill_in 'task_task_name', with: 'name'
        click_on 'search'
      end
     it 'Key word search' do
      expect(page).to have_content 'name'
     end
    end
    context 'Status Search' do
      before do
        select 'in_progress', from: 'task[status]'
        click_on 'search'
      end
     it 'Filter Status matched ' do
       expect(page).to have_content 'in_progress'
     end
    end
    context 'Fuzzy Search Task and Status Search' do
      before do
        fill_in 'task_task_name', with: 'Long'
        select 'in_progress', from: 'task[status]'
        click_on 'search'
      end
      it 'Contain Fuzzy search task and status' do
       expect(page).to have_content 'Long'
       expect(page).to have_content 'in_progress'
      end
    end
  end

  describe 'Detailed display function' do
    let!(:show_task){FactoryBot.create(:show_task, user_id: user.id)}
    before do
      visit tasks_path
      first('tbody tr').click_on 'Show'
    end
    context 'When transitioned to any task details screen' do
      it 'The content of the relevant task is displayed' do
        expect(page).to have_content show_task.task_name
      end
    end
  end
end

  