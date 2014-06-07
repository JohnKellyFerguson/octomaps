FactoryGirl.define do
  factory :repository do
    full_name { "#{Faker::Name.first_name}/#{name}" }
    github_id { Random.new.rand(1..100) }
    name { "#{Faker::Lorem.word}" }
    description { Faker::Company.catch_phrase }
    homepage { Faker::Internet.http_url }
    size { Random.new.rand(0..10000) }
    forked false
    github_forks_count { Random.new.rand(0..100) }
    github_stargazers_count { Random.new.rand(0..100) }
    github_watchers_count { Random.new.rand(0..100) }
    github_subscribers_count { Random.new.rand(0..100) }
    github_created_at DateTime.new
    github_updated_at DateTime.new
    github_pushed_at DateTime.new
  end
end
