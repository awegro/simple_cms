class SectionsController < ApplicationController
layout 'admin'
    def index
      list
      render('list')
    end

    def new
      @section = Section.new(:name => 'default')
    end

    def list
      @sections = Section.order("sections.position ASC")
    end

    def show
      @section = Section.find(params[:id])
    end

    def create
      #Instantiate a new object using form parameters
      @section = Section.new(params[:section])
      #Save the object
      if @section.save
      #If save succeeds, redirect to the list action
        redirect_to(:action => 'list')
        flash[:notice] = 'Section created'
      else
      #If save fails, redisplay the form so that the user can fix problems
        render('new')
    end
    end

    def edit
      @section = Section.find(params[:id])
    end  

    def delete
      @section = Section.find(params[:id])
    end

    def destroy
      Section.find(params[:id]).destroy
      redirect_to(:action => 'list')
      flash[:notice] = 'Section deleted'
    end

    def update
      @section = Section.find(params[:id])
      if @section.update_attributes(params[:section])
        redirect_to(:action => 'show', :id => @section.id)
        flash[:notice] = 'Section updated'
      else
        render('edit')
      end

  end 

end
