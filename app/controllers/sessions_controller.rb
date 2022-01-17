class SessionsController < ApplicationController
  def index
    @session = Session.all
    render component: 'Session', props:{ sessions: @sessions }
  end

  def show
    @session = Session.find(params[:id])
    render component: 'Sesssion', props: { session: @session }
  end

  def new
    @session = Session.new
    render component: 'SessionNew', props: { session: @session }
  end

  def edit
    @session = Session.find(params[:id])
    render component: 'SessionEdit', props: { session: @session }
  end

  def create
    @session = Session.new(session_params)
    if session.save
    else 
      render component: 'SessionNew', props { session: @session }
    end 
  end 

  def update
    @session = Session.find(params[:id])
    if @model_name.update(session_params)
    else
      render component: 'SessionEdit', props: { session: @session }
    end 
  end 

  def destroy
    @session = Session.find(params[:id])
    @session.destroy
    or
    Session.find(params[:id]).destroy
  end 

  private 
  def session_params
    params.requre(:session).permit(:name, :image_url, :slug)
  end 
end
