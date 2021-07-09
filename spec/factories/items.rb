FactoryBot.define do
  factory :item do
    product_name      {"aaaa"}
    description_name  {"特になし"}
    price             {300}
    area_id           {6}
    burden_id         {2}
    delivery_state_id {4}
    category_id       {2}
    day_to_ship_id    {3}
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
