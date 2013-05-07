class ProductsController < ApplicationController
  helper_method :sort_column, :sort_direction


  # GET /products
  # GET /products.json
  def index
    if (params[:selected_category].nil? || params[:selected_category].blank?)
        @selected_category = nil;
    else
        @selected_category = params[:selected_category]
    end

    @categories = Category.all;
    if @selected_category
         logger.info 'pass by find with selected_category = ' + params[:selected_category]
         #@products = Product.find(:all, :conditions => ['category_id LIKE ?', "%#{params[:selected_category]}%"])
         productArray = Product.where("category_id = ?", @selected_category).order(sort_column + " "  + sort_direction)
         @products = Kaminari.paginate_array(productArray).page(params[:page]).per(10)

    else
        logger.info 'pass by find without selected_category'
        #@products = Product.page(params[:page]).per(10).order(sort_column + " "  + sort_direction)
        productArray = Product.order(sort_column + " "  + sort_direction);
        @products = Kaminari.paginate_array(productArray).page(params[:page]).per(10)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])

  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])
    @categories = Category.all;

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, :notice => 'Product was successfully created.' }
        format.json { render :json => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.json { render :json => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, :notice => 'Product was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :ok }
    end
  end

  private

  def sort_column
    params[:sort] ||= "name"
  end

  def sort_direction
    params[:direction] ||= "asc"
  end


end
