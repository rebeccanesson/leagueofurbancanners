class PruningsController < ApplicationController
  # GET /prunings
  # GET /prunings.json
  def index
    @prunings = Pruning.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @prunings }
    end
  end

  # GET /prunings/1
  # GET /prunings/1.json
  def show
    @pruning = Pruning.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pruning }
    end
  end

  # GET /prunings/new
  # GET /prunings/new.json
  def new
    @pruning = Pruning.new
    @pruning.fruit_tree_id = params[:fruit_tree_id] if params[:fruit_tree_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pruning }
    end
  end

  # GET /prunings/1/edit
  def edit
    @pruning = Pruning.find(params[:id])
  end

  # POST /prunings
  # POST /prunings.json
  def create
    @pruning = Pruning.new(params[:pruning])

    respond_to do |format|
      if @pruning.save
        format.html { redirect_to @pruning, notice: 'Pruning was successfully created.' }
        format.json { render json: @pruning, status: :created, location: @pruning }
      else
        format.html { render action: "new" }
        format.json { render json: @pruning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /prunings/1
  # PUT /prunings/1.json
  def update
    @pruning = Pruning.find(params[:id])

    respond_to do |format|
      if @pruning.update_attributes(params[:pruning])
        format.html { redirect_to @pruning, notice: 'Pruning was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pruning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prunings/1
  # DELETE /prunings/1.json
  def destroy
    @pruning = Pruning.find(params[:id])
    @pruning.destroy

    respond_to do |format|
      format.html { redirect_to prunings_url }
      format.json { head :no_content }
    end
  end
end
