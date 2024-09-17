class BetsController < InheritedResources::Base

  def index
  end

  def create
    binding.pry
  end

  private

    def bet_params
      params.require(:bet).permit()
    end

end
