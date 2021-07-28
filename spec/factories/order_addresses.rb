FactoryBot.define do
  factory :order_address do
    postal_code      {"123-4567"}
    area_id          {5}
    from_city        {"横浜市緑区"}
    from_address     {"青山1-1-1"}
    building_name    {"柳ビル103"}
    phone_number     {"09012345678"}
    token            {"tok_1df42d739c351ceb94cdae52a556"}
  end
end
