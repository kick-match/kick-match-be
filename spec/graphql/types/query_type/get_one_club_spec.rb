require 'rails_helper'

RSpec.describe Types::QueryType, type: :request do
  # describe 'return one talent/athlete' do
    self.let(:subject) do
      self.described_class #allows tesing of a module
    end

    describe 'sport_club' do
      types = GraphQL::Define::TypeDefiner.instance

      it 'returns club details' do
          @team1 = SportClub.create(name: 'Denver SoccerClub', location: 'Denver CO', league: 'G leagure', zipcode: 80207, email: 'denfutbol@gmail.com', phone: '720-555-4114', tournaments: 'Colorado Championchip', coach_resume: 'Fred Hampton is a motivated Illinois Native interested in using his pro experience to guide youth to their full potential.', currently_looking: 'Goalie,  Mid Foward')


          post '/graphql', params: { query: club_query }

          json = JSON.parse(response.body, symbolize_names: true)
          data = json[:data][:club]
          expect(data[:id]).to eq(@team1.id.to_s)
          expect(data[:name]).to eq(@team1.name)
          expect(data[:location]).to eq(@team1.location)
          expect(data[:league]).to eq(@team1.league)
      end
    end

    it 'can query for a single instance of sport club' do
        @team1 = SportClub.create(name: 'Denver SoccerClub', location: 'Denver CO', league: 'G leagure', zipcode: 80207, email: 'denfutbol@gmail.com', phone: '720-555-4114', tournaments: 'Colorado Championchip', coach_resume: 'Fred Hampton is a motivated Illinois Native interested in using his pro experience to guide youth to their full potential.', currently_looking: 'Goalie,  Mid Foward')

      result = KickMatchBESchema.execute(club_query).as_json
      query_result = result["data"]["club"]
      expect(query_result["id"]).to eq(@team1.id.to_s)
      expect(query_result["name"]).to eq(@team1.name)
      expect(query_result["location"]).to eq(@team1.location)
      expect(query_result["league"]).to eq(@team1.league)
    end

    def club_query
      <<~GQL
      {
        club(id: #{@team1.id}) {
          id,
          name,
          location,
          league,
          zipcode,
          email,
          phone,
          tournaments,
          coachResume,
          currentlyLooking
        }
      }
      GQL
    end
  end
