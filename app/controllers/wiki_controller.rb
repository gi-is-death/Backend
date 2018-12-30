class WikiController < ApplicationController
    include DbHelper

    def create
        result = createRow?(Wiki) do |data|
            data.date = Time.now
            data.author_ID = params[:author_ID]
            data.title = params[:title]
            data.content = params[:content]
            data.seen = 0
        end
        head :no_content
    end

    def update
        result = updateRow?(Wiki, params[:id]) do |data|
            data.date = Time.now
            data.author_ID = params[:author_ID]
            data.title = params[:title]
            data.content = params[:content]
        end
        render nothing: true
    end

    def delete
        result = deleteRow?(Wiki, params[:id])
        render nothing: true
    end

    def read
        render json: readRow(Wiki, params[:id]) do |data|
            data.seen = data.seen + 1
            data.save
        end
    end
end
