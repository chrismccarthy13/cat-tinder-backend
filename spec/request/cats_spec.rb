require 'rails_helper'

RSpec.describe "Cats API", :type => :request do
    it "gets a list of Cats" do
      # Create a new cat in the Test Database (not the same one as development)
      Cat.create(name: 'Felix', age: 2, enjoys: 'Walks in the park')

      # Make a request to the API
      get '/cats'

      # Convert the response into a Ruby Hash
      json = JSON.parse(response.body)

      # Assure that we got a successful response
      expect(response).to have_http_status(:ok)

      # Assure that we got one result back as expected
      expect(json.length).to eq 1
    end

    it "creates a cat" do
        # The params we are going to send with the request
        cat_params = {
            cat: {
                name: 'Buster',
                age: 4,
                enjoys: 'Meow Mix, and plenty of sunshine.'
            }
        }

        # Send the request to the server
        post '/cats', params: cat_params

        # Assure that we get a success back
        expect(response).to have_http_status(:ok)

        # Look up the cat we expect to be created in the Database
        new_cat = Cat.find_by(name:'Buster')

        # Assure that the created cat has the correct attributes
        expect(new_cat.name).to eq('Buster')
    end
end
