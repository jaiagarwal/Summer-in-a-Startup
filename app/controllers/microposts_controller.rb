class MicropostsController < ApplicationController
  before_action :signed_in_user

  def create
    @startup = Startup.find(get_startup_id)
    @micropost = @startup.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to @startup
    else
      flash[:failure] = "Enter valid content"
      redirect_to @startup
    end
  end

  def destroy
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
