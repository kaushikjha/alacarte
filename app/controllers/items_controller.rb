class ItemsController < ApplicationController
  load_and_authorize_resource
  
  # GET /items/new
  # GET /items/new.xml
  def new
    @user = current_user
    if params[:category_id]
      @category = @user.categories.find(params[:category_id])
      @menu = @category.menu
      @item = @category.items.new
    else
      @menu = @user.menus.find(params[:menu_id])
      @item = Item.new
    end
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
    @user = current_user
    @item = @user.items.find(params[:id])
    @category = @item.category
    @menu = @category.menu
  end

  # POST /items
  # POST /items.xml
  def create
    @user = current_user
    @item = Item.new(params[:item])
    @item.user = @user
    if !params[:menu_id].blank?
      @menu = @user.menus.find(params[:menu_id])
    else
      @category = @user.categories.find(params[:category_id])
      @menu = @category.menu
    end

    respond_to do |format|
      if @item.save
        flash[:notice] = 'Item was successfully created.'
        format.html {
          if params['add_another.x']
            redirect_to new_category_item_path(@item.category)
          else
            redirect_to(@item.category.menu)
          end
          }
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
    render :nothing => true
  end
end
