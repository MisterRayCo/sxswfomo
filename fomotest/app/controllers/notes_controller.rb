class NotesController < ApplicationController
  before_filter :find_note, :only => [:show, :edit, :destroy, :update]
  before_filter :user_gate, :only => [:edit, :create, :update, :destroy]

  def all
    @notes = Note.all

  end

  def index
    @event = Event.find(params[:event_id])
    @notes = Note.where(:event_id => @event.id)
  end

  def show
    @note = Note.find(params[:id])


  end

  def new
    @note = Note.new
    @event = Event.find(params[:event_id])
  end

  def edit
    @note = Note.find(params[:id])
  end

  def create
    @note = Note.new(params[:note])


  end

  def update
    @note = Note.find(params[:id])


  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

  end

  private
  def find_note
    Note.find(params[:note_id])
  end

  def user_gate
    if !@auth_user.nil?
      if @auth_user.user_type != "admin" && @auth_user != User.find(@note.user_id)
        redirect_to root_path
      end
    else
      redirect_to login_path
    end
  end

end
