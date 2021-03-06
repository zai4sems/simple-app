class RecipesController < ApplicationController
   
   def index
       @recipes = Recipe.all
   end
   
   def new
      @recipe = Recipe.new 
      
   end
   
   def create
      @recipe = Recipe.new(recipe_params)
    if @recipe.save
        redirect_to recipes_path
    else
        render 'new'
    end
   end
   
   def edit
      @recipe = Recipe.find(params[:id]) 
   end
   
   def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
        redirect_to recipes_path
    else
        render 'edit'
    end
   end
   
   def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = "Recipe was successfully deleted"
    redirect_to recipes_path
   end
   
   def recipe_params
      params.require(:recipe).permit(:name, quantities_attributes: [:id, :recipe_id, :ingredient_id, :amount, :_destroy, ingredient_attributes: [:id, :name, :price, :_destroy]]) 
   end
end