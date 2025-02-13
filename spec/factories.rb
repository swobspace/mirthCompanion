# frozen_string_literal: true

FactoryBot.define do
  sequence :aname do |n|
    "aname_#{n}"
  end

  sequence :lid do |n|
    "L#{n}"
  end

  sequence :amail do |n|
    "mail_#{n}@example.net"
  end

  sequence :url do |n|
    "tcp://#{Faker::Internet.ip_v4_address}:#{n}"
  end

  factory :alert do
    server
    type { 'alert' }
    message { 'some text' }
  end

  factory :channel do
    server
    uid { `uuid -v 4` }
  end

  factory :channel_counter do
    channel
    server
    channel_statistic
  end

  factory :channel_statistic do
    association :server
    association :channel
    server_uid { `uuid -v 4` }
    channel_uid { `uuid -v 4` }
    condition { 0 }
  end

  factory :channel_statistic_group do
    name { generate(:aname) }
  end


  factory :escalation_level do
    association :escalatable, factory: :channel_statistic
    association :notification_group
  end

  factory :escalation_time do
    association :escalation_level
    weekdays {[1,2,3,4,5]}
  end

  factory :host do
    association :location
    association :software_group
    name { generate(:aname) }
  end

  factory :interface_connector do
    software_interface
    name { generate(:aname) }
    type { 'TxConnector' } 
    url { 'tcp://1.2.3.4:5678' }
  end

  factory :location do
    lid { generate(:lid) }
    name { generate(:aname) }
  end

  factory :note do
    association :user
    type { 'acknowledge' }
    message { 'some text' }
    trait :with_server do
      association :notable, factory: :server
    end
    trait :with_channel do
      association :notable, factory: :channel
    end
    trait :with_channel_statistic do
      association :notable, factory: :channel_statistic
    end

  end

  factory :notification_group do
    name { generate(:aname) }
  end

  factory :server do
    name { generate(:aname) }
    trait :with_uid do
      uid { `uuid -v 4` }
    end
  end

  factory :server_configuration do
    server
  end

  factory :software do
    location
    software_group
    name { generate(:aname) }
  end

  factory :software_connection do
    location
    server
    source_url { generate(:url) }
    destination_url { generate(:url) }
  end

  factory :software_group do
    name { generate(:aname) }
  end

  factory :software_interface do
    software
    host
    name { generate(:aname) }
  end

end
