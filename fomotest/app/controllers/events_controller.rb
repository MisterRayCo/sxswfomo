class EventsController < ApplicationController
  before_filter :find_event, :only => [:show, :edit, :destroy, :update]

  def index
    @events = Event.all

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
  end

  def update
    @event = Event.find(params[:id])

  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

  end

  private
  def find_event
    @event = Event.find(params[:id]) if params[:id]
  end
end
