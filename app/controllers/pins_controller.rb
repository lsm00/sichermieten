class PinsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_pin, only: [:show, :edit, :update, :destroy]

  def index
  #User see only own items:
    #@pins = current_user.pins.all.order("created_at DESC") #Show all content of current logged in user only
  #Everyone can see everything:
    @pins = Pin.all.order("created_at DESC") #Show all content of all user
  end

  def new
    @pin = current_user.pins.build
  end

  def show
#No code = see all items; Code below shows items of owner:
  #  if current_user == @pin.user                                      #Check if current user is owner of content
  #    @pins = current_user.pins.all.order("created_at DESC")          #Show in desc. order
  #  else
  #    flash[:danger] = "Wrong user! You are not allowed to do this!"  #If wrong user, show warning
  #    redirect_to root_path                                           #Go back to root
  #  end
  end

  def create
    @pin = current_user.pins.build (pin_params)
    if @pin.save
      redirect_to @pin, notice: "Success creating your entry!"
    else
      render 'new'
    end
  end

  def edit
    if current_user == @pin.user   #checks if current user is owner of the pin
      @pin = Pin.find(params[:id])
    else
      flash[:danger] = "Wrong user! You are not allowed to do this!"
      redirect_to @pin
    end
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: "Update successful!"
    else
      render 'edit'
    end
  end

  def destroy
    if current_user == @pin.user
      @pin.destroy
      redirect_to root_path
    else
      flash[:danger] = "Wrong user!"
      redirect_to @pin
    end
  end


  private

  def pin_params
    params.require(:pin).permit(:title, :description, :addon, :image)
  end

  def find_pin
    @pin = Pin.find(params[:id])
  end

end
