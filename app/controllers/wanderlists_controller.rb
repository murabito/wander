class WanderlistsController < ApplicationController

  before_filter :find_wanderlist, :only => [:show, :edit, :update]

  def index
    @wanderlists = Wanderlist.all
  end

  def show
  end

  def new
    @wanderlist = Wanderlist.new
  end

  def create
    @wanderlist = Wanderlist.new(params[:wanderlist])
    if @wanderlist.save
      flash[:notice] = "Wanderlist has been saved."
      redirect_to @wanderlist
    else
      flash[:alert] = "Wanderlist was not saved."
      render :new
    end
  end

  def edit
  end

  def update
    if @wanderlist.update_attributes(params[:wanderlist])
      flash[:notice] = "Wanderlist has been updated."
      redirect_to @wanderlist
    else
      flash[:alert] = "Wanderlist was not updated."
      render :edit
    end
  end

private
  def find_wanderlist
    @wanderlist ||= Wanderlist.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "This wanderlist could not be found."
    redirect_to wanderlists_path
  end   
end

