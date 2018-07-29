class WikisController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user!, except: [ :index, :show ]

  after_action :verify_authorized, :except => :index

  def index
    @wikis = policy_scope(Wiki)

  end

  def show
    @wiki = Wiki.find(params[:id])
    @collaboration = @wiki.collaborators.new
    authorize @wiki
  end

  def new
    @user = current_user
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @user = current_user
    @wiki = current_user.wiki.build(wiki_params)
    @wiki.user = current_user
    authorize @wiki

    if @wiki.save
      redirect_to @wiki, notice: "Wiki was saved successfully."
    else
      flash[:error] = "Error creating wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    @collaborator = Collaborator.new
    authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki

    @wiki.assign_attributes(wiki_params)

    if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash[:error] = "Error saving wiki. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    authorize @wiki

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to action: :index
    else
      flash[:error] = "There was an error deleting the wiki."
      render :show
    end
  end

 private

  def wiki_params
     params.require(:wiki).permit(:title, :body, :private, :user)
  end

end
