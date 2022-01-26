require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'Validation' do
    context 'Task with empty title' do
      it 'Getting Validation  ' do
        empty_task_name = Task.new(task_name: '', description: 'Empty Task Name')
        expect(empty_task_name).not_to be_valid
      end
    end
    context 'Task with empty description' do
      it 'Validation is caught' do
        empty_description = Task.new(task_name: 'Empty description', description: '')
        expect(empty_description).not_to be_valid
      end
    end
    context 'If the task Title and details are described' do
      it 'Validation passes' do
        task = Task.new(task_name: 'Task name', description: 'Task description')
        expect(task).to be_valid
      end
    end
  end



  describe 'Search Function' do
    let!(:task){ FactoryBot.create(:task) }
    let!(:second_task){ FactoryBot.create(:second_task, status: 'completed') }
    let!(:latest_task){ FactoryBot.create(:latest_task)}
    context 'Fuzzy Search by Scope Method' do
      it 'Key words searched' do
        expect(Task.search_task_name('1')).to include(task)
        expect(Task.search_task_name('Late')).not_to include(task)
        expect(Task.search_task_name('Late').count).to eq 1
      end
    end
    context 'Status Search by scope' do
      it 'Status searched' do
        expect(Task.search_status('completed').count).to eq 2
      end
    end
    context 'Status and Fuzzy search by scope' do
      it 'Status and Fuzzy searched by scope' do
        expect(Task.search_task_name('Late') && Task.search_status('completed')).to include(latest_task)
      end
    end
  end
end
