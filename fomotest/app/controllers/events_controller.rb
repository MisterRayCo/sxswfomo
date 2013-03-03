class EventsController < ApplicationController
  before_filter :find_event, :only => [:show, :edit, :destroy, :update]

  def index
    @events = Event.all(:select => "#{Event.table_name}.*, COUNT(#{Note.table_name}.id) number_of_notes",
                        :joins => :notes,
                        :order => "number_of_notes")

    @event_count = @events.length
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.delete
    redirect_to root_path
  end

  def findbydate
	@events = Event.where(params[:date])
  end


  private
  def find_event
    @event = Event.find(params[:id]) if params[:id]
  end

  
end
