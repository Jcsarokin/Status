class StatisController < ApplicationController
  before_action :set_stati, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @statis = Stati.all
  end

  def show
  end

  def new
    @stati = current_user.statis.build
  end

  def edit
  end

  def create
    @stati = current_user.statis.build(stati_params)

    respond_to do |format|
      if @stati.save
        format.html { redirect_to @stati, notice: 'Stati was successfully created.' }
        format.json { render action: 'show', status: :created, location: @stati }
      else
        format.html { render action: 'new' }
        format.json { render json: @stati.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @stati.update(stati_params)
        format.html { redirect_to @stati, notice: 'Stati was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stati.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statis/1
  # DELETE /statis/1.json
  def destroy
    @stati.destroy
    respond_to do |format|
      format.html { redirect_to statis_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stati
      @stati = Stati.find_by(id: params[:id])
    end

    def correct_user
      @stati = current_user.statis.find_by(id: params[:id])
      redirect_to statis_path, notice: "Not authorized to edit this" if @stati.nil?
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stati_params
      params.require(:stati).permit(:description)
    end
end
