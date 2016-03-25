class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.build(dose_params)

    respond_to do |format|
      if @dose.save
        format.html { redirect_to cocktail_path(@cocktail), notice: 'Dose was successfully created.' }
        format.json { render :show, status: :created, location: cocktail_path(@cocktail) }
      else
        format.html { render :new }
        format.json { render json: @dose.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to cocktails_url, notice: 'Dose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def dose_params
      params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
    end

  end
