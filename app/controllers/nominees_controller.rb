class NomineesController < InheritedResources::Base

  private

    def nominee_params
      params.require(:nominee).permit()
    end

end
