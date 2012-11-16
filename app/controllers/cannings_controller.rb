class CanningsController < ApplicationController
    load_and_authorize_resource
  # GET /cannings
  # GET /cannings.json
  def index
    @cannings = Canning.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cannings }
    end
  end

  # GET /cannings/1
  # GET /cannings/1.json
  def show
    @canning = Canning.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @canning }
    end
  end

  # GET /cannings/new
  # GET /cannings/new.json
  def new
    @canning = Canning.new
    @canning.canning_session_id = params[:canning_session_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @canning }
    end
  end

  # GET /cannings/1/edit
  def edit
    @canning = Canning.find(params[:id])
  end

  # POST /cannings
  # POST /cannings.json
  def create
    @canning = Canning.new(params[:canning])

    respond_to do |format|
      if @canning.save
        format.html { redirect_to @canning, notice: 'Canning was successfully created.' }
        format.json { render json: @canning, status: :created, location: @canning }
      else
        format.html { render action: "new" }
        format.json { render json: @canning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cannings/1
  # PUT /cannings/1.json
  def update
    @canning = Canning.find(params[:id])

    respond_to do |format|
      if @canning.update_attributes(params[:canning])
        format.html { redirect_to @canning, notice: 'Canning was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @canning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cannings/1
  # DELETE /cannings/1.json
  def destroy
    @canning = Canning.find(params[:id])
    @canning.destroy

    respond_to do |format|
      format.html { redirect_to cannings_url }
      format.json { head :no_content }
    end
  end
end
