class NoticeController < ApplicationController
    # ID int PK
    # date date
    # author_ID int
    # title varchar(256)
    # content varchar(256)
    # seen int
    def create
        notice = Notice.new
        notice.date = Time.now
        notice.author_ID = params[:author_ID]
        notice.title = params[:title]
        notice.content = params[:content]
        notice.seen = 0

        @result = notice.save
    end

    def read
        notice = Notice.find(params[:id])

        notice.seen = notice.seen + 1
        notice.save

        @data = notice.to_json
    end

    def paging
        page = params[:page].to_i
        totalpage = Notice.count / 10 + 1
        if page <= totalpage
            pages = Notice.limit(10).offset(10 * (page-1))
            @result = pages.to_json
        else
            @result = {}.to_json
        end
    end

    def update
        notice = Notice.find(params[:id])
        notice.date = Time.now
        notice.author_ID = params[:author_ID]
        notice.title = params[:title]
        notice.content = params[:content]
        @result = notice.save
    end

    def delete
        notice = Notice.find(params[:id])
        notice.destroy
        @result = {"result" => notice.destroy?}
        @result = @result.to_json
    end
end
