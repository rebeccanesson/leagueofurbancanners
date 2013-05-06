class SitesController < ApplicationController
    helper_method :sort_column, :sort_direction
    load_and_authorize_resource
  # GET /sites
  # GET /sites.json
  def index
    @site_filters = params[:site_filters]
    @fruit_ids = params[:fruit_ids].collect { |i| i.to_i } if params[:fruit_ids]
    @zipcode_filters = params[:zipcode_filters]
    if (@fruit_ids)
        @sites = Site.has_fruit_in(@fruit_ids).joins(:lurc_contact).order(sort_column + ' ' + sort_direction)
    else
        @sites = Site.joins(:lurc_contact).order(sort_column + ' ' + sort_direction)
    end
    
    if @site_filters
        @site_filters.each do |site_filter|
            @sites = Site.filter_sites_by(@sites, site_filter); 
        end
    end
    
    if @zipcode_filters
        @sites = Site.filter_sites_by_zipcodes(@sites, @zipcode_filters)
    end
        
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sites }
    end
  end
  
  def map
      @site_filters = params[:site_filters]
      @fruit_ids = params[:fruit_ids].collect { |i| i.to_i } if params[:fruit_ids]
      @zipcode_filters = params[:zipcode_filters]
      if (@fruit_ids)
          @sites = Site.has_fruit_in(@fruit_ids).joins(:lurc_contact).order(sort_column + ' ' + sort_direction)
      else
          @sites = Site.joins(:lurc_contact).order(sort_column + ' ' + sort_direction)
      end

      if @site_filters
          @site_filters.each do |site_filter|
              @sites = Site.filter_sites_by(@sites, site_filter); 
          end
      end

      if @zipcode_filters
          @sites = Site.filter_sites_by_zipcodes(@sites, @zipcode_filters)
      end
      @map_json = @sites.to_gmaps4rails do |site, marker|
          marker.infowindow render_to_string(:partial => "marker_info", :locals => { :site => site })
          marker.json({ :id => site.id, :link => site_url(site) })
      end

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @sites }
      end     
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
    @site = Site.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site }
    end
  end

  # GET /sites/new
  # GET /sites/new.json
  def new
    @site = Site.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site }
    end
  end

  # GET /sites/1/edit
  def edit
    @site = Site.find(params[:id])
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = Site.new(params[:site])

    respond_to do |format|
      if @site.save
        format.html { redirect_to @site, notice: 'Site was successfully created.' }
        format.json { render json: @site, status: :created, location: @site }
      else
        format.html { render action: "new" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sites/1
  # PUT /sites/1.json
  def update
    @site = Site.find(params[:id])

    respond_to do |format|
      if @site.update_attributes(params[:site])
        format.html { redirect_to @site, notice: 'Site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    respond_to do |format|
      format.html { redirect_to sites_url }
      format.json { head :no_content }
    end
  end
  
  private
  def sort_column
      if params[:sort] == 'lurc_contact_id'
          "LOWER(people.last_name)"
      elsif Site.column_names.include?(params[:sort]) 
          "sites." + params[:sort] 
      else 
          "sites.status"
      end
  end
  
  def sort_direction
     %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end
