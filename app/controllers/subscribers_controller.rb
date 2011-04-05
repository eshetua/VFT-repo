class SubscribersController < ApplicationController
  def index
    @subscriber = Subscriber.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subscriber }
    end
  end

  # POST /subscribers
  # POST /subscribers.xml
  def create
    @subscriber = Subscriber.new(params[:subscriber])

    respond_to do |format|
      if @subscriber.save
        format.html { redirect_to(@subscriber, :notice => 'Subscriber was successfully created.') }
        format.xml  { render :xml => @subscriber, :status => :created, :location => @subscriber } 
        format.js {render 'create_success'}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subscriber.errors, :status => :unprocessable_entity }
        format.js {render 'create_failure'}
      end
    end
  end
end
