class SubjectsController < ApplicationController
  layout 'admin'
  
  def index
    list
    render('list')
  end
  
  def new
    @subject = Subject.new(:name => 'default')
  end
  
  def list
    @subjects = Subject.order("subjects.position ASC")
  end
  
  def show
    @subject = Subject.find(params[:id])
  end
  
  def create
    #Instantiate a new object using form parameters
    @subject = Subject.new(params[:subject])
    #Save the object
    if @subject.save
    #If save succeeds, redirect to the list action
      redirect_to(:action => 'list')
      flash[:notice] = 'Subject created'
    else
    #If save fails, redisplay the form so that the user can fix problems
      render('new')
  end
  end
  
  def edit
    @subject = Subject.find(params[:id])
  end  
  
  def delete
    @subject = Subject.find(params[:id])
  end
  
  def destroy
    Subject.find(params[:id]).destroy
    redirect_to(:action => 'list')
    flash[:notice] = 'Subject deleted'
  end
  
  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(params[:subject])
      redirect_to(:action => 'show', :id => @subject.id)
      flash[:notice] = 'Subject updated'
    else
      render('edit')
    end
  end
  
end 
