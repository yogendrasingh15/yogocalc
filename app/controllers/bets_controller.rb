class BetsController < InheritedResources::Base

  def index
    @bets = Bet.where(user_id: current_user.id)
  end

  def create
  end

  private

    def bet_params
      params.require(:bet).permit()
    end

end
