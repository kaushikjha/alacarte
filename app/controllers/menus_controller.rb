class MenusController < ApplicationController
  load_and_authorize_resource
  
  before_filter do |controller|
    :require_token unless controller.request.format.html?
  end
  
  # GET /menus
  # GET /menus.xml
  def index
    @user = current_user
    @menus = @user.menus
    
    if @menus.count == 1
      redirect_to @menus.first
    else
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @menus }
      end
    end
  end

  # GET /menus/1
  # GET /menus/1.xml
  def show
    @user = current_user
    @menu = @user.menus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @menu.to_xml(:include => {:categories => {:include => {:items => {:include => :prices}}}}) }
    end
  end

  # GET /menus/new
  # GET /menus/new.xml
  def new
    @menu = Menu.new
    m = Menu.find(:all)
    if m.size < 1
      @menu.position = 1
    else
      @menu.position = m.last.position + 1
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @menu }
    end
  end

  # GET /menus/1/edit
  def edit
    @menu = Menu.find(params[:id])
  end

  # POST /menus
  # POST /menus.xml
  def create
    @user = current_user
    @menu = @user.menus.new(params[:menu])
    
    m = @user.menus.find(:all)
    if m.present?
      @menu.position = m.last.position + 1
    else
      @menu.position = 1
    end    

    respond_to do |format|
      if @menu.save
        flash[:notice] = 'Menu was successfully created.'
        format.html { redirect_to(@menu) }
        format.xml  { render :xml => @menu, :status => :created, :location => @menu }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @menu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /menus/1
  # PUT /menus/1.xml
  def update
    @menu = Menu.find(params[:id])

    respond_to do |format|
      if @menu.update_attributes(params[:menu])
        flash[:notice] = 'Menu was successfully updated.'
        format.html { redirect_to(@menu) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @menu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.xml
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy

    respond_to do |format|
      format.html { redirect_to(menus_url) }
      format.xml  { head :ok }
    end
  end
  
  def print
    @menu = Menu.find(params[:id])
    render :layout => "print"
  end
  
  def position
    menu = current_user.menus.find(params[:id])
    menu.insert_at(params[:position])
    render :nothing => true
  end
end
