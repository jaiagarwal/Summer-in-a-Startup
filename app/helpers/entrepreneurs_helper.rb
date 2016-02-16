module EntrepreneursHelper
 def correct_entrepreneur_user
       @temp = Users.find_by(email: current_user.email)
       if @temp.type="Student"
          return false
       else
          @entrepreneur = Entrepreneur.find(params[:id])
          if @entrepreneur==current_user
             return true
          else
             return false
          end
       end          
  end
end
