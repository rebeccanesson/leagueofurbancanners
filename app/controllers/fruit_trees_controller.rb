class FruitTreesController < ApplicationController
    helper_method :sort_column, :sort_direction
    load_and_authorize_resource
  # GET /fruit_trees
  # GET /fruit_trees.json
  def index
    @fruit_trees = FruitTree.order(sort_column + ' ' + sort_direction).paginate(:per_page => 25, :page => params[:page])

    @map_json = @fruit_trees.to_gmaps4rails do |fruit_tree, marker|
        marker.infowindow render_to_string(:partial => "sites/marker_info", :locals => { :site => fruit_tree.site })
        marker.json({ :id => fruit_tree.id, :link => fruit_tree_url(fruit_tree) })
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fruit_trees }
    end
  end

  # GET /fruit_trees/1
  # GET /fruit_trees/1.json
  def show
    @fruit_tree = FruitTree.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fruit_tree }
    end
  end

  # GET /fruit_trees/new
  # GET /fruit_trees/new.json
  def new
    @fruit_tree = FruitTree.new
    @fruit_tree.site_id = params[:site_id] if params[:site_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fruit_tree }
    end
  end

  # GET /fruit_trees/1/edit
  def edit
    @fruit_tree = FruitTree.find(params[:id])
  end

  # POST /fruit_trees
  # POST /fruit_trees.json
  def create
    @fruit_tree = FruitTree.new(params[:fruit_tree])

    respond_to do |format|
      if @fruit_tree.save
        format.html { redirect_to @fruit_tree, notice: 'Fruit tree was successfully created.' }
        format.json { render json: @fruit_tree, status: :created, location: @fruit_tree }
      else
        format.html { render action: "new" }
        format.json { render json: @fruit_tree.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fruit_trees/1
  # PUT /fruit_trees/1.json
  def update
    @fruit_tree = FruitTree.find(params[:id])

    respond_to do |format|
      if @fruit_tree.update_attributes(params[:fruit_tree])
        format.html { redirect_to @fruit_tree, notice: 'Fruit tree was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fruit_tree.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fruit_trees/1
  # DELETE /fruit_trees/1.json
  def destroy
    @fruit_tree = FruitTree.find(params[:id])
    @fruit_tree.destroy

    respond_to do |format|
      format.html { redirect_to fruit_trees_url }
      format.json { head :no_content }
    end
  end
  
  private
  def sort_column
    FruitTree.column_names.include?(params[:sort]) ? "fruit_trees." + params[:sort] : "fruit_trees.fruit_id"
  end
  
  def sort_direction
     %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end
