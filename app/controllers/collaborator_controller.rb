class CollaboratorsController < ApplicationController

  def new
    @collaborator = Collaborator.new
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find_by(email: params[:email])
    @collaborator = @wiki.collaborators.build(user_id: @user.id)

    if @collaborator.save
      flash[:notice] = "Collaborator was added to this wiki."
      redirect_to @wiki
    else
      flash[:error] = "Collaborator was not added. Please try again."
      render :show
    end
   end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaboration = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "Collaborator was removed from this wiki."
      redirect_to @wiki
    else
      flash[:error] = "Collaborator was not removed. Please try again."
      render :show
    end
   end

  private

  def collaboration_params
    params.require(:collaborator).permit(:user_id)
  end

end
