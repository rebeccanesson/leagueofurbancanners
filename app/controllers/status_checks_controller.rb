class StatusChecksController < ApplicationController
    load_and_authorize_resource
  # GET /status_checks
  # GET /status_checks.json
  def index
    @status_checks = StatusCheck.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @status_checks }
    end
  end

  # GET /status_checks/1
  # GET /status_checks/1.json
  def show
    @status_check = StatusCheck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @status_check }
    end
  end

  # GET /status_checks/new
  # GET /status_checks/new.json
  def new
    @status_check = StatusCheck.new
    @status_check.fruit_tree_id = params[:fruit_tree_id] if params[:fruit_tree_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @status_check }
    end
  end

  # GET /status_checks/1/edit
  def edit
    @status_check = StatusCheck.find(params[:id])
  end

  # POST /status_checks
  # POST /status_checks.json
  def create
    @status_check = StatusCheck.new(params[:status_check])

    respond_to do |format|
      if @status_check.save
        format.html { redirect_to @status_check, notice: 'Status check was successfully created.' }
        format.json { render json: @status_check, status: :created, location: @status_check }
      else
        format.html { render action: "new" }
        format.json { render json: @status_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /status_checks/1
  # PUT /status_checks/1.json
  def update
    @status_check = StatusCheck.find(params[:id])

    respond_to do |format|
      if @status_check.update_attributes(params[:status_check])
        format.html { redirect_to @status_check, notice: 'Status check was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @status_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_checks/1
  # DELETE /status_checks/1.json
  def destroy
    @status_check = StatusCheck.find(params[:id])
    @status_check.destroy

    respond_to do |format|
      format.html { redirect_to status_checks_url }
      format.json { head :no_content }
    end
  end
end
