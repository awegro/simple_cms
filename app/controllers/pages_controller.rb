class PagesController < ApplicationController
  layout = 'admin'
  
  def index
    list
    render('list')
  end
  
  def list
    @pages = Page.order("pages.position ASC")
  end
  
  def show
    @page = Page.find(params[:id])
  end
  
  def new
    @page = Page.new()
  end
  
  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to(:action =>'list')
    else
      render('new')
    end
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def update
      @page = Page.find(params[:id])
      if @page.update_attributes(params[:page])
        redirect_to(:action =>'show', :id => @page.id)
      else
        render('edit')
      end
    end
  def delete
    @page = Page.find(params[:id])
  end
  
  def destroy
    Page.find(params[:id]).destroy
    redirect_to(:action => 'list')
    flash[:notice] = 'Page deleted'
  end
  
end
