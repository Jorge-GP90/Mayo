FactoryBot.define do
    factory :task do
      task_name { 'Task_name 1 made by Factory' }
      description { 'Default description created by Factory 1' }
    end

    factory :second_task, class: Task do
      task_name { 'Task_name 2 made by Factory' }
      description { 'Default description created by Factory 1' }
    end

    factory :new_task, class: Task do
      task_name { 'test-task name' }
      discription { 'test-description name' }
    end
    factory :show_task, class: Task do
      task_name { 'Test-task  detail screen' }
      discription { 'Test-description detail screen' }
    end
  end
  