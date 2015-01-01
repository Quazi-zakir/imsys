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
    @section = Section.new(params[:section])
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
    if @section.update_attributes(params[:section])
      redirect_to sections_path "Section successfully saved"
    else
      render "new"
    end
  end
  #------------------------------------------------------------------------------------------------------
  def destroy
  end
  #------------------------------------------------------------------------------------------------------
end
