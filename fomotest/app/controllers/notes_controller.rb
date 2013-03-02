class NotesController < ApplicationController
  before_filter :find_note, :only => [:show, :edit, :destroy, :update]
  before_filter :user_gate, :only => [:edit, :update, :destroy]
  before_filter :find_event, :except => [:all]

  def all
    @notes = Note.all

  end

  def index
    @notes = Note.where(:event_id => @event.id)
  end

  def show

  end

  def new
    @note = Note.new
    @event = Event.find(params[:event_id])
  end

  def edit

  end

  def create
    @note = Note.new(params[:note])
    if @note.save
      @note.event = @event
      @note.user = @auth_user
      @note.save!
      redirect_to event_notes_path(@event, @note)
    else
      render :new
    end

  end

  def update


  end

  def destroy
    @note.destroy

  end

  private
  def find_note
    @note = Note.find(params[:id])
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

  def find_event
    @event = Event.find(params[:event_id]) if params[:event_id]
  end
end
