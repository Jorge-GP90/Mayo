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
        empty_discription = Task.new(task_name: 'Empty description', description: '')
        expect(empty_discription).not_to be_valid
      end
    end
    context 'If the task Title and details are described' do
      it 'Validation passes' do
        task = Task.new(task_name: 'Task name', description: 'Task description')
        expect(task).to be_valid
      end
    end
  end
end
