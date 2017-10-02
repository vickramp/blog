class RegistrationsController < Devise::RegistrationsController

 def destroy
     comment = (User.find current_user.id).comments
   comment.each do |c|
       c.destroy!
   end
    current_user.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Account has been deactivated succesfully' }
      format.json { head :no_content }
    end
  end

private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
  end
end
