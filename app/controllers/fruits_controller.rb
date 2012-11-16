class FruitsController < ApplicationController
  # GET /fruits
  # GET /fruits.json
  def index
    @fruits = Fruit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fruits }
    end
  end

  # GET /fruits/1
  # GET /fruits/1.json
  def show
    @fruit = Fruit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fruit }
    end
  end

  # GET /fruits/new
  # GET /fruits/new.json
  def new
    @fruit = Fruit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fruit }
    end
  end

  # GET /fruits/1/edit
  def edit
    @fruit = Fruit.find(params[:id])
  end

  # POST /fruits
  # POST /fruits.json
  def create
    @fruit = Fruit.new(params[:fruit])

    respond_to do |format|
      if @fruit.save
        format.html { redirect_to @fruit, notice: 'Fruit was successfully created.' }
        format.json { render json: @fruit, status: :created, location: @fruit }
      else
        format.html { render action: "new" }
        format.json { render json: @fruit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fruits/1
  # PUT /fruits/1.json
  def update
    @fruit = Fruit.find(params[:id])

    respond_to do |format|
      if @fruit.update_attributes(params[:fruit])
        format.html { redirect_to @fruit, notice: 'Fruit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fruit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fruits/1
  # DELETE /fruits/1.json
  def destroy
    @fruit = Fruit.find(params[:id])
    @fruit.destroy

    respond_to do |format|
      format.html { redirect_to fruits_url }
      format.json { head :no_content }
    end
  end
end
