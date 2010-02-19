class ItemsController < ApplicationController
  load_and_authorize_resource
  # GET /items/new
  # GET /items/new.xml
  def new
    @category = Category.find(params[:category_id])
    @item = @category.items.new
    if @item.prices.length == 0
      @item.prices.build
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.xml
  def create
    @category = Category.find(params[:category_id])
    @item = @category.items.new(params[:item])
    @item.user_id = current_user.id

    respond_to do |format|
      if @item.save
        flash[:notice] = 'Item was successfully created.'
        format.html { redirect_to(@category.menu) }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        flash[:notice] = 'Item was successfully updated.'
        format.html { redirect_to(@item.category.menu) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])
    @menu = @item.category.menu
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(@menu) }
      format.xml  { head :ok }
    end
  end
  
  def position
    item = current_user.items.find(params[:id])
    item.insert_at(params[:position])
    render :layout => false
  end
end
