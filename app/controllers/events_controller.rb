class EventsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_event, only: [:enroll, :unenroll]

    def index 
        @events = Event.all 
        @registered_events = Registration.where(user_id: current_user.id).pluck(:event_id)
    end
    
    def new 
        @event = Event.new
    end

    def create 
        @event = Event.create(event_params)

        if @event.save 
            redirect_to events_path
        else  
            render :new, status: :unprocessable_entity
        end
    end 

    def enroll 
        regi = Registration.new(event_id: @event.id)
        regi.user_id = current_user.id
        if regi.save 
            flash.now[:notice] = "Registered Successfully."
        else
            flash.now[:error] = "Can not register."
        end
        redirect_to events_path 
    end

    def unenroll 
        regi = Registration.where(event_id: @event.id, user_id: current_user.id).take
        if regi && regi.destroy 
            flash.now[:notice] = "Unenrolled successfully."
        else
            flash.now[:error] = "Can not Un-Enroll."
        end
        redirect_to events_path 
    end

    private 
    def set_event 
        @event = Event.find(params[:event_id]) 
    end

    def event_params 
        params.require(:event).permit(:title, :description, :event_time)
    end
end
