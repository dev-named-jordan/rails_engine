FactoryBot.define do
	factory :merchant do
		name { Faker::Games::LeagueOfLegends.champion }
	end
end
