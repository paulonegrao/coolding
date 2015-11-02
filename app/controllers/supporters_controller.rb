class SupportersController < ApplicationController

before_action(:find_supporter, {only: [:show, :edit, :update, :destroy, :done]})

    def new
      @s = Supporter.new
    end

    def create
      @s = Supporter.new(supporter_params)
      if @s.save
        redirect_to(supporter_path(@s), notice: "Supporter created!")
      else
        render :new
      end
    end

  def show
  end

  def edit
  end

  def update
    if @s.update(supporter_params)
      redirect_to supporter_path(@s), notice: "Request updated!"
    else
      render :edit
    end
  end

  def index
    @s = Supporter.all
  end

  def destroy
    @s.destroy
    flash[:notice] = "Request deleted successfully"
    redirect_to supporters_path
  end

  def done
    if @s.photo == "Not Done"
      @s.update_attributes(:photo => "Done")
    else
      @s.update_attributes(:photo => "Not Done")
    end
    @s = Supporter.all.order(:photo).reverse
    render :index
  end

  private

  def supporter_params
    params.require(:supporter).permit([:name, :email, :department, :message, :photo])
  end

  def find_supporter
    @s = Supporter.find params[:id]
  end

end
