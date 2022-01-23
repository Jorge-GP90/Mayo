require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
  describe 'New creation function' do
    let!(:new_task){ FactoryBot.build(:new_task) }
     before do
       visit new_task_path
       fill_in 'Task name', with: new_task.task_name
       fill_in 'Description', with: new_task.description
       click_on 'Register'
    end
    context 'When creating a new task' do
      it 'The created task is displayed' do
       expect(page).to have_selector '.alert-success', text: new_task.task_name    
      end
    end
  end
  describe 'List display function' do
    let!(:task){ FactoryBot.create(:task) }
    let!(:second_task){ FactoryBot.create(:second_task) }
    let!(:latest_task){ FactoryBot.create(:latest_task) }
    before do
      visit tasks_path
    end
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed' do
        expect(page).to have_content task.task_name
        expect(page).to have_content second_task.description
      end
    end
    context 'When tasks are arranged in descending order of creation date and time' do
it'new task is displayed at the top' do
          expect(first('.task_row')).to have_content latest_task.task_name
end
    end
  end
  describe 'Detailed display function' do
    let!(:show_task){FactoryBot.create(:show_task)}
    before do
      visit tasks_path
      first('tbody tr').click_on 'Show'
    end
    context 'When transitioned to any task details screen' do
      it 'The content of the relevant task is displayed' do
        expect(page).to have_content show_task.description
      end
    end
  end
end