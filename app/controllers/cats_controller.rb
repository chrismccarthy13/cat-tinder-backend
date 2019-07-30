class CatsController < ApplicationController


    def index
        cats = Cat.all
        render json: cats
    end

    def show
        cat = Cat.find(params[:id])
        render json: cat
    end
    def destroy
        cat = Cat.find(params[:id])
        cat.destroy
    end
    def update
        cat = Cat.find(params[:id])
        cat.update(cat_params)
        render json: cat
    end
    def create
        cat = Cat.create(cat_params)
        if cat.valid?
            render json: cat
        else
            render json: cat.errors, status: :unprocessable_entity
        end
    end

    def cat_params
        params.require(:cat).permit(:name, :age, :enjoys)
    end
end


#
# describe "Cats API" do
#   it "gets a list of Cats" do
#     # Create a new cat in the Test Database (not the same one as development)
#     Cat.create(name: 'Felix', age: 2, enjoys: 'alot of text here')
#
#     # Make a request to the API
#     gets '/cats'
#
#     # Convert the response into a Ruby Hash
#     json = JSON.parse(response.body)
#
#     # Assure that we got a successful response
#     expect(response).to be_success
#
#     # Assure that we got one result back as expected
#     expect(json.length).to eq 3
#   end
# end
