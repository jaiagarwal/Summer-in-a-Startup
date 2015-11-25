module StartupsHelper

  def set_startup_id(startup)
      $id=startup.id
  end

  def get_startup_id
      $id
  end

  def correct_startup_user(startup)
       @user = Users.find_by(email: current_user.email)
       if @user.type!="Entrepreneur"
          return false
       else
          if current_user.id==startup.entrepreneur_id
             return true
          else
             return false
          end
       end          
  end
end
