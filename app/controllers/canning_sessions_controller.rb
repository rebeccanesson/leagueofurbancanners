class CanningSessionsController < ApplicationController
  # GET /canning_sessions
  # GET /canning_sessions.json
  def index
    @canning_sessions = CanningSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @canning_sessions }
    end
  end

  # GET /canning_sessions/1
  # GET /canning_sessions/1.json
  def show
    @canning_session = CanningSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @canning_session }
    end
  end

  # GET /canning_sessions/new
  # GET /canning_sessions/new.json
  def new
    @canning_session = CanningSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @canning_session }
    end
  end

  # GET /canning_sessions/1/edit
  def edit
    @canning_session = CanningSession.find(params[:id])
  end

  # POST /canning_sessions
  # POST /canning_sessions.json
  def create
    @canning_session = CanningSession.new(params[:canning_session])

    respond_to do |format|
      if @canning_session.save
        format.html { redirect_to @canning_session, notice: 'Canning session was successfully created.' }
        format.json { render json: @canning_session, status: :created, location: @canning_session }
      else
        format.html { render action: "new" }
        format.json { render json: @canning_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /canning_sessions/1
  # PUT /canning_sessions/1.json
  def update
    @canning_session = CanningSession.find(params[:id])

    respond_to do |format|
      if @canning_session.update_attributes(params[:canning_session])
        format.html { redirect_to @canning_session, notice: 'Canning session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @canning_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /canning_sessions/1
  # DELETE /canning_sessions/1.json
  def destroy
    @canning_session = CanningSession.find(params[:id])
    @canning_session.destroy

    respond_to do |format|
      format.html { redirect_to canning_sessions_url }
      format.json { head :no_content }
    end
  end
end
