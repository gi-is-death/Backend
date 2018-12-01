class MemberController < ApplicationController
    include DbHelper

    def paging
        if(params[:page].to_i == 0)
            render json: paginationTable(Member)
        else
            render json: pagingRow(Memeber, params[:page])
        end
    end

    def read 
        render json: readRow(Member, params[:id])
    end

    def update
        result = updateRow?(Member, params[:id]) do |member|
            memeber.name = params[:name]
            member.grade = params[:grade]
            member.major = params[:major]
            member.mobile_number = params[:mobile_number]
            member.email = params[:email]
            # password varchar(256)
        end
        render nothing: true
    end

    def delete
        result = deleteRow?(Member, params[:id])
        render nothing: true
    end
end
