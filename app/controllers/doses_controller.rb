class DosesController < ApplicationController


  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @new_dose = Dose.new(dose_params)
    @new_dose.cocktail = @cocktail
    @ingredients = Ingredient.all
    if @new_dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end


  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end

