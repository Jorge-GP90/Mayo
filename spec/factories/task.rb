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
      task_name { 'Test New Task Name' }
      description { 'Test New Taks Description ' }
    end
    factory :show_task, class: Task do
      task_name { 'Task Name Display' }
      description { 'Test Description Display' }
    end
    factory :latest_task, class: Task do
      task_name { 'Latest task' }
      description { 'Listed in descending order of creation date and time' }
    end
  end
  