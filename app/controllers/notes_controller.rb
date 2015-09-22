class NotesController < ApplicationController
  before_action :find_note, only: [:show, :edit, :update, :destroy]
  
  
  def index
    @notes= Note.where(user_id: current_user) 
    @categories= Categorization.where(user_id: current_user) 
  end
  
  def show
    
  end
  
  def new
    @note = current_user.notes.build
  end
  
  def create
    @note = current_user.notes.build(note_params)
    
    if @note.save
      flash[:notice] ="Your note was created successfully"
      redirect_to @note
    else
      flash.now[:alert]= "Your note was not created.Try it again"
      render 'new'
    end
    
  end
  
  def edit
    
  end
  
  def update
    if @note.update(note_params)
      flash[:notice] ="Your note was edited successfully"
      redirect_to @note
    else
      flash.now[:alert]= "Your could not be edited.Try it again"
      render 'edit'
    end
  end
  
  def destroy
    @note.destroy
    flash[:alert]= "Your note has been deleted successfully"
    redirect_to notes_path
  end
  
  private
  
    def find_note
      @note = current_user.notes.find_by(id: params[:id])
      redirect_to notes_path, notice: "Not authorized to view this note" if @note.nil?
    end
    
    def note_params
      params.require(:note).permit(:title, :content, :categorization_id)
    end
  
end
