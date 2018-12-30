class NoticeController < ApplicationController
    include DbHelper, SessionsHelper
    def create
        result = createRow?(Notice) do |data|
            data.date = Time.now
            data.author_ID = params[:author_ID]
            data.title = params[:title]
            data.content = params[:content]
            data.seen = 0
        end
        head :no_content
    end

    def update
        # if user_signed_in?
            # row = readRow(Notice, params[:id])
            # user = current_user
            # if user[:id] == row[:author_ID]
        result = updateRow?(Notice, params[:id]) do |data|
            data.date = Time.now
            data.author_ID = params[:author_ID]
            data.title = params[:title]
            data.content = params[:content]
        end
            # end
        # end
        render nothing: true
    end

    def delete
        # if user_signed_in?
            # row = readRow(Notice, params[:id])
            # user = current_user
            # if user[:id] == row[:author_ID]
        result = deleteRow?(Notice, params[:id])
            # end
        # end
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
