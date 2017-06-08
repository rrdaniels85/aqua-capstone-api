# frozen_string_literal: true

class TanksController < ProtectedController
  before_action :set_tank, only: [:show, :update, :destroy]

  # GET /tanks
  # GET /tanks.json
  def index
    @tanks = current_user.tanks.all

    render json: @tanks
  end

  # GET /tanks/1
  # GET /tanks/1.json
  def show
    render json: @tank
  end

  def create
    #    @tank = Tank.new(tank_params)

    @tank = current_user.tanks.build(tank_params)

    if @tank.save
      render json: @tank, status: :created
    else
      render json: @tank.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tanks/1
  # PATCH/PUT /tanks/1.json
  def update
    if @tank.update(tank_params)
      render json: @tank
    else
      render json: @tank.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tanks/1
  # DELETE /tanks/1.json
  def destroy
    @tank.destroy

    head :no_content
  end

  def set_tank
    @tank = current_user.tanks.find(params[:id])
  end

  def tank_params
    params.require(:tank).permit(:name, :water)
  end

  private :set_tank, :tank_params
end
