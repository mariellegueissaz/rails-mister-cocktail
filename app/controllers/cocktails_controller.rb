class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    if @cocktail.photo.attached?
      @photo = @cocktail.photo
    else
      @photo = "https://s3.amazonaws.com/lowres.cartoonstock.com/pubs-bars-cocktail-martinis-cocktail_parties-alcoholic_drink-negroni-rbon1537_low.jpg"
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
