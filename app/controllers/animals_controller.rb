class AnimalsController < ApplicationController
  def index
    animals = Animal.all
    render json: animals
  end

  def create
    animal = Animal.create(animal_params)
    render json: animal
  end

  def update
    animal = Animal.find(params[:id])
    animal.update(animal_params)
    render json: animal
  end

  def destroy
    animal = Animal.find(params[:id])
    animal.destroy
    render json: animal
  end

  private
  def animal_params
    params.require(:animal).permit(:common_name, :scientific_binomial)
  end
end
