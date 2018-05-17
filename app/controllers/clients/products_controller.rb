class Clients::ProductsController < ApplicationController
  def index
    response = Unirest.get("http://localhost:3000/api/products")
    @products = response.body
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    client_params = {
                      name: params[:name]
                      price: params[:price]
                      img_url: params[:img_url]
                      description: params[:description
                    }
    response = Unirest.post(
                            "http://localhost:3000/api/products", parameters: client_params
                            )
    product = response.body

    redirect_to "/client/products/#{product["id"] }"
  end

end

  def show
    product_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/products/#{product_id}")
    @product = response.body
    render 'show.html.erb'
  end

    def edit
    @recipe_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/recipes/#{recipe_id}")
    @recipe = response.body
    render 'edit.html.erb'
  end

  def update
    client_params = {
                      title: params[:title],
                      chef: params[:chef],
                      ingredients: params[:ingredients],
                      directions: params[:directions],
                      prep_time: params[:prep_time],
                      image_url: params[:image_url]
                    }
    response = Unirest.patch(
                              "http://localhost:3000/api/recipes/#{params[:id] }",
                              parameters: client_params
                            )
    product = response.body

    redirect_to "/client/prodcuts/#{product["id"] }"
  end

  def destroy
    product_id = params[:id]
    response = Unirest.delete("http://localhost:3000/api/products/#{product_id}")
    render 'destroy.html.erb'
  end
end
