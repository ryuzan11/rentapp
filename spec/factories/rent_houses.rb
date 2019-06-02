FactoryBot.define do
  factory :rent_house do
    user { nil }
    construction { nil }
    prefecture { nil }
    city { nil }
    walkTime { nil }
    layout { nil }
    buildingType { nil }
    old { nil }
    stationName { "MyString" }
    lineName { "MyString" }
    rent { 1 }
    managementFee { 1 }
    separate { "MyString" }
    floor { 1 }
    woman { "MyString" }
    balconi { "MyString" }
    daylight { "MyString" }
    comment { "MyText" }
    roomSize { "MyString" }
    buildingName { "MyString" }
  end
end
