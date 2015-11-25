module StudentsHelper

   def correct_student_user
       @temp = Users.find_by(email: current_user.email)
       if @temp.type="Entrepreneur"
          return false
       else
          @student = Student.find(params[:id])
          if @student==current_user
             return true
          else
             return false
          end
       end          
  end
end
