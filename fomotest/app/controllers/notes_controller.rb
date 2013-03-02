class NotesController < ApplicationController
  before_filter :find_note, :only => [:show, :edit, :destroy, :update]

  # GET /notes
  # GET /notes.json
  def all
    @notes = Note.all

  end

  def index
    @event = Event.find(params[:event_id])
    @notes = Note.where(:event_id => @event.id)
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @note = Note.find(params[:id])


  end

  # GET /notes/new
  # GET /notes/new.json
  def new
    @note = Note.new

  end

  # GET /notes/1/edit
  def edit
    @note = Note.find(params[:id])
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(params[:note])


  end

  # PUT /notes/1
  # PUT /notes/1.json
  def update
    @note = Note.find(params[:id])


  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note = Note.find(params[:id])
    @note.destroy

  end
end
