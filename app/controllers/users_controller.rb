class UsersController < ApplicationController
    load_and_authorize_resource
   
   def edit
       @user = User.find(params[:id])
   end
   
   def update
     @user = User.find(params[:id])
     respond_to do |format|
       if @user.update_without_password(params[:user])
         format.html { redirect_to people_url }
         format.json { head :no_content }
       else
         format.html { render action: "edit" }
         format.json { render json: @user.errors, status: :unprocessable_entity }
       end
      end
   end
    
end