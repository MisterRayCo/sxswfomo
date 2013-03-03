class NotesController < ApplicationController
  before_filter :find_note, :only => [:show, :edit, :destroy, :update, :vote_up, :vote_down]
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
    if @note.update_attributes(params[:note])
      redirect_to events_note_path(@note)
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
  end

  def vote_up
    if !@auth_user
      flash[:errors] = "You must be logged in to do that."
    elsif @auth_user.up_vote(@note)
      flash[:errors] = "You are unable to vote for that."
    end

    render :show
  end

  def vote_down
    if !@auth_user
      flash[:errors] = "You must be logged in to do that."
    elsif @auth_user.down_vote(@note)
      flash[:errors] = "You are unable to vote for that."
    end

    render :show
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
