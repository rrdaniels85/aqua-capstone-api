# frozen_string_literal: true

class AnimalsController < ProtectedController
  def index
    @animals = current_user.tanks.find(params[:tank_id]).animals

    render json: @animals
  end

  def create
    @animal = current_user.tanks.find(params[:tank_id]).animals.build(animal_params)

    if @animal.save
      render json: @animal
    else
      render json: @animal.errors.to_a, status: :unprocessable_entity
    end
  end

  def update
    @animal = current_user.tanks.find(params[:tank_id]).animals.find(params[:id])
    if @animal.update(animal_params)
      head :no_content
    else
      render json: @animal.errors.to_a, status: :unprocessable_entity
    end
  end

  def destroy
    current_user.tanks.find(params[:tank_id]).animals.find(params[:id]).destroy

    head :no_content
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :species, :color)
  end
end
