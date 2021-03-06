class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.all
  end

  def new
    @event = Event.create
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(title: params[:title],
                        description: params[:description],
                        location: params[:location],
                        start_date: params[:start_date],
                        duration: params[:duration].to_i,
                        price: params[:price].to_i,
                        admin_id_id: current_user.idl)
    if @event.save
      flash[:success] = "The event has been saved."
      redirect_to root_path
    else
      render 'new'
    end
  end



end
