class ClientsController < ApplicationController
  before_filter :require_user
  before_filter :find_client, :except => [:index, :new, :create]

  def index
    @clients = @user.clients
  end

  def show
  end

  def new
    @client = Client.new
  end
  
  def create
    @client = Client.new(params[:client])
    @client.user = current_user
    if @client.save
      flash[:notice] = 'Client successfully created.'
      redirect_to :action => 'show', :id => @client.id
    else
      render :action => 'new'
    end
  end
  
  def edit
  end

  def update
    if @client.update_attributes(params[:client])
      flash[:notice] = 'Client successfully updated.'
      redirect_to :action => 'show', :id => @client.id
    else
      render :action => 'new'
    end
  end

  def destroy
  end
  
  private
  
  def find_client
    # TODO: restrict this to user's clients
    @client = Client.find_by_id(params[:id])
  end
end
