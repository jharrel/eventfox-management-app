class SearchesController < ApplicationController

    def new
        @search = Search.new
        @project = Projects.uniq.pluck(:category)
    end

    def create
        @search = Search.create(search_params)
        redirect_to @search
    end

    def show
        @search = Search.find(params[:id])
    end

    private

    def search_params
        params.require(:search).permit(:project, :task)
    end

end
