FactoryBot.define do
  factory :label, class: Label do
    label_name { "Label１" }
  end
  factory :second_label, class: Label do
    label_name { "Label２" }
  end
  factory :third_label, class: Label do
    label_name { "Label３" }
  end
end
