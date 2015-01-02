class SectionsController < ApplicationController
  #------------------------------------------------------------------------------------------------------
  def index
    @section = Section.all
  end
  #------------------------------------------------------------------------------------------------------
  def new
    @section = Section.new
  end
  #------------------------------------------------------------------------------------------------------
  def create
    #@section = Section.new(params[:section])
    @section = Section.new(section_params)
    if @section.save
      redirect_to sections_path :notice => "Section successfully saved."
    else
      render "new"
    end
  end
  #------------------------------------------------------------------------------------------------------
  def show
    @section = Section.find(params[:id])
  end
  #------------------------------------------------------------------------------------------------------
  def edit
    @section = Section.find(params[:id])

  end
  #------------------------------------------------------------------------------------------------------
  def update
    @section = Section.find(params[:id])
    #if @section.update_attributes(params[:section])
    #if @user.update_attributes(section_params)if @team.update(team_params)

    if @section.update(section_params)
      redirect_to sections_path "Section successfully saved"
    else
      render "new"
    end
  end
  #------------------------------------------------------------------------------------------------------
  def destroy
  end
  #------------------------------------------------------------------------------------------------------
  def section_params
    params.require(:section).permit(:section_name)
  end
  #------------------------------------------------------------------------------------------------------
end
