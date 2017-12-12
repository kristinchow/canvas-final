# userscontroller, all other controllers generated with devise
class UsersController < ApplicationController
  # GET /grades/1
  # GET /grades/1.json
  def show
    @user = User.find(params[:id])
    @assignments = @user.assignments
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email)
  end
end
