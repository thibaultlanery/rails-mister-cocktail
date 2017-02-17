class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new
  end

  def create
    @dose = Doses.new(doses_params)
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.save
  end

  private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
