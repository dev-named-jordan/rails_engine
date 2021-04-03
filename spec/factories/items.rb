FactoryBot.define do
	factory :item do
		name { Faker::Games::LeagueOfLegends.champion }
		description { Faker::Lorem.word}
		unit_price { Faker::Number.decimal(l_digits: 3, r_digits:2)}
		merchant
	end
end
