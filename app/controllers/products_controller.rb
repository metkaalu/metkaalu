class ProductsController < ApplicationController
  # GET /products
  # GET /products.xml

  before_filter :confirm_logged_in
  before_filter :find_store

  def index
    @products = Product.search(params[:query], params[:store_id])
    #@store.products = @products
    # @products = Product.where(:store_id => @store.id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  def show_all
    @products = Product.search(params[:query], params[:store_id])
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])
    @product_images = @product.product_images.order('product_images.position ASC')
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new(:store_id => @store.id)    
    @product_images = []

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @product_images = @product.product_images.order('product_images.position ASC')
  end

  # POST /products
  # POST /products.xml
  def create
    # @product = Product.new(params[:product])
    @product = @store.products.new(params[:product])
    @product.categories = Category.find(params[:category_ids]) if params[:category_ids]
    process_file_uploads(@product)

    respond_to do |format|
      if @product.save
        flash[:notice] = 'Product was successfully created.'
        format.html { redirect_to(:action => 'index', :store_id => @store.id) }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])
    @product.categories = Category.find(params[:category_ids]) if params[:category_ids]
    process_file_uploads(@product)
    respond_to do |format|
      if @product.update_attributes(params[:product])
        flash[:notice] = 'Product was successfully updated.'
        format.html { redirect_to(:action => 'index', :store_id => @store.id) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(store_products_url) }
      format.xml  { head :ok }
    end
  end

  def sort    
    params[:img_list].each_with_index do |id, index|
      ProductImage.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end

  private
  def find_store
    if params[:store_id]
      @store = Store.find_by_id(params[:store_id])
    end
  end

  #Montar todos los archivos
  protected
  def process_file_uploads(product)
      i = 0
      if !params[:attachment].nil?
        while params[:attachment]['file_'+i.to_s] != "" && !params[:attachment]['file_'+i.to_s].nil?
            product.product_images.build(:image => params[:attachment]['file_'+i.to_s], :position => i+1)
            i += 1
        end
      end
  end
  
  
end
