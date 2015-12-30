FactoryGirl.define do
  factory :message do
    to Message.my_number
    from Message.default_number
    body "Something"
  end

end
