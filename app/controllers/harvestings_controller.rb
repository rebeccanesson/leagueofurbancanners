class HarvestingsController < ApplicationController
  # GET /harvestings
  # GET /harvestings.json
  def index
    @harvestings = Harvesting.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @harvestings }
    end
  end

  # GET /harvestings/1
  # GET /harvestings/1.json
  def show
    @harvesting = Harvesting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @harvesting }
    end
  end

  # GET /harvestings/new
  # GET /harvestings/new.json
  def new
    @harvesting = Harvesting.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @harvesting }
    end
  end

  # GET /harvestings/1/edit
  def edit
    @harvesting = Harvesting.find(params[:id])
  end

  # POST /harvestings
  # POST /harvestings.json
  def create
    @harvesting = Harvesting.new(params[:harvesting])

    respond_to do |format|
      if @harvesting.save
        format.html { redirect_to @harvesting, notice: 'Harvesting was successfully created.' }
        format.json { render json: @harvesting, status: :created, location: @harvesting }
      else
        format.html { render action: "new" }
        format.json { render json: @harvesting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /harvestings/1
  # PUT /harvestings/1.json
  def update
    @harvesting = Harvesting.find(params[:id])

    respond_to do |format|
      if @harvesting.update_attributes(params[:harvesting])
        format.html { redirect_to @harvesting, notice: 'Harvesting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @harvesting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /harvestings/1
  # DELETE /harvestings/1.json
  def destroy
    @harvesting = Harvesting.find(params[:id])
    @harvesting.destroy

    respond_to do |format|
      format.html { redirect_to harvestings_url }
      format.json { head :no_content }
    end
  end
end
