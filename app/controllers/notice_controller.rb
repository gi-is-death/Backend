class NoticeController < ApplicationController
    include DbHelper
    def create
        result = createRow?(Notice) do |data|
            data.date = Time.now
            data.author_ID = params[:author_ID]
            data.title = params[:title]
            data.content = params[:content]
            data.seen = 0
        end
        render nothing: true
    end

    def update
        result = updateRow?(Notice, params[:id]) do |data|
            data.date = Time.now
            data.author_ID = params[:author_ID]
            data.title = params[:title]
            data.content = params[:content]
        end
        render nothing: true
    end

    def delete
        result = deleteRow?(Notice, params[:id])
        render nothing: true
    end

    def read
        render json: readRow(Notice, params[:id]) do |data|
            data.seen = data.seen + 1
            data.save
        end
    end

    def paging
        if(params[:page].to_i == 0)
            render json: paginationTable(Notice)
        else
            render json: pagingRow(Notice, params[:page])
        end
    end
end
