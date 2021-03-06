class CategoriesController < ApplicationController
  load_and_authorize_resource

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.xml
  def create
    @menu = Menu.find(params[:menu_id])
    @category = @menu.categories.new(params[:category])
    @category.user = current_user

    respond_to do |format|
      if @category.save
        flash[:notice] = 'Category was successfully created.'
        format.html { redirect_to(@menu) }
        format.xml  { render :xml => @menu, :status => :created, :location => @category }
      else
        flash[:error] = 'Categories must have a name'
        format.html { redirect_to(@menu) }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        flash[:notice] = 'Category was successfully updated.'
        format.html { redirect_to(@category.menu) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category = Category.find(params[:id])
    @menu = @category.menu
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(@menu) }
      format.xml  { head :ok }
    end
  end
  
  def position
    category = current_user.categories.find(params[:id])
    category.insert_at(params[:position])
    render :nothing => true
  end
end
