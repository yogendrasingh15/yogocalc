class RolesController < InheritedResources::Base
  actions :index, :show, :new, :create, :edit, :update, :destroy

  protected

  def collection
    @roles = Role.ordered
  end

  private

  def role_params
    params.require(:role).permit(:name, :user_id)
  end
end
