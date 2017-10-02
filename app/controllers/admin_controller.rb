class AdminController < ApplicationController
  before_action :authenticate_user!

def new
   if can? :create, Topic
    @user=User.new
else
    redirect_to root_path, notice:'U are not authorized to see the page'
end
end
    
def create
    respond_to do |format|
      t=user_params['email']
      User.all.each do|user|
            if(t==user.email)
                user.admin=true
                user.save
                format.html { redirect_to root_path, notice: user.email+' is added as Admin' }
            end
        end
        format.html { redirect_to add_path, notice: 'invalid email' }
        end
    end
  
def demote
    respond_to do |format|
      t=user_params['email']
      User.all.each do|user|
            if(t==user.email)
                user.admin=false
                user.save
                format.html { redirect_to root_path, notice: user.email+' is no longer an Admin' }
            end
        end
        format.html { redirect_to add_path, notice: 'invalid email' }
        
    end
end  
def user_params
      params.require(:user).permit(:email)
end
end