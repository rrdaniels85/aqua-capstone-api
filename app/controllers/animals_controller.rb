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
    @animal = Animal.joins(:tank).where(tanks: {user_id: current_user.id}).find(params[:id])

    if @animal.update_attributes(animal_params)
      render json: @animal
    else
      render json: @animal.errors.to_a, status: :unprocessable_entity
    end
  end

  def destroy
    @animal = Animal.joins(:tank).where(tanks: {user_id: current_user.id, id: params[:tank_id]}).find_by(animals: {id: params[:id]})
    if @animal.destroy
      render json: { id: @animal.id }
    else
      render json: { id: @animal.id }, status: :unprocessable_entity
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :material)
  end
end
