FactoryBot.define do
    factory :task do
      task_name { 'Task_name 1 ' }
      description { 'Default description created T1' }
      expired_at { 'February 01, 2022 00:00' }
      status { 'completed' }
    end

    factory :second_task, class: Task do
      task_name { 'Task_name 2 ' }
      description { 'Default description created T2' }
      expired_at { 'March 01, 2022 00:00' }
      status { 'not_started' }
    end

    factory :new_task, class: Task do
      task_name { 'T3 New Task Name' }
      description { 'Test New Taks Description T3' }
      expired_at { '2022-04-01 00:00:00' }
      status { 'completed' }
    end
    factory :show_task, class: Task do
      task_name { 'Task Name Display T4' }
      description { ' T4 Test Description Display' }
      expired_at { '2022-05-01 00:00:00' }
      status { 'completed' }
    end
    factory :latest_task, class: Task do
      task_name { 'Latest task T5' }
      description { ' T5 Listed in descending order of creation date and time' }
      expired_at { 'June 01, 2022 00:00' }
      status { 'in_progress' }
    end
    factory :longest_task, class: Task do  
      task_name { 'Longest Task T6' }
      description { 'T6 Longest execution task' }
      expired_at { 'December 31, 2022 00:00' }
      status { 'in_progress' }
    end
  end
  