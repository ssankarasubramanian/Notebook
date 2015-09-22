class CategorizationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_category, only: [:show, :edit, :update, :destroy]
  
  
  def new
    @category = current_user.categorizations.build
  end
  
  def create
    @category = current_user.categorizations.build(category_params)
    
    if @category.save
      flash[:notice] ="Your note was created successfully"
      redirect_to @category
    else
      flash.now[:alert]= "Your note was not created.Try it again"
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @category.update(note_params)
      flash[:notice] ="Your note was edited successfully"
      redirect_to @category
    else
      flash.now[:alert]= "Your could not be edited.Try it again"
      render 'edit'
    end
  end
  
  def show
    
  end
  
  def destroy
    @category.destroy
    flash[:alert]= "Your note has been deleted successfully"
    redirect_to notes_path
  end
  
  private
    
    def find_category
      @category = current_user.categorizations.find_by(id: params[:id])
      redirect_to authenticated_root_path, notice: "Not authorized to view this" if @category.nil?
    end
    
    def category_params
      params.require(:categorization).permit(:name)
    end
  
  
end