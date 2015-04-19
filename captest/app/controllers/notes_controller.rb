class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all
    if user_signed_in?
	@my_notes = current_user.notes
    end

  end

  def show
  end

  def new
    @note = current_user.notes.new
  end

  def edit
	@note = Note.find(params[:id])
  end

  def create    
    
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    if @note.save
	redirect_to note_path(@note)
    else
	render :new
    end
  end

  def update
    if @note.update(note_params)
	redirect_to @note
    else
	render :edit
    end
  end

  def destroy
	@note = Note.find(params[:id])
	@note.destroy
	redirect_to notes_url
  end

  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:title, :input, :user_id)
    end
end
