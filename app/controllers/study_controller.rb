class StudyController < ApplicationController
    include DbHelper

    def paging
        if(params[:page].to_i == 0)
            render json: paginationTable(Study)
        else
            render json: pagingRow(Study, params[:page])
        end
    end

    def create
        result = createRow(Study) do |study|
            study.name = params[:name]
            study.description = params[:description]
            study.is_registration = params[:is_registration]
            study.year = params[:year]
            study.semester = params[:semester]
            study.limit_num_of_mem = params[:limit_num_of_mem]
            study.num_of_mem = 0
            study.leader_ID = params[:leader_ID]
        end
        render nothing: true
    end

    def read 
        render json: readRow(Study, params[:id])
    end

    def update
        result = updateRow?(Study, params[:id]) do |study|
            study.name = params[:name]
            study.description = params[:description]
            study.is_registration = params[:is_registration]
            study.year = params[:year]
            study.semester = params[:semester]
            study.limit_num_of_mem = params[:limit_num_of_mem]
            study.leader_ID = params[:leader_ID]
        end
        render nothing: true
    end

    def delete
        result = deleteRow?(Study, params[:id])
        render nothing: true
    end

    def participate
        # result = createTake(Logged ID, params[:id]).to_json
        render nothing: true
    end

    def members
        takes = Take_Study.where('study_ID = ?', params[:id])
        render json: takes
    end

    def createTake(mem_ID, study_ID)
        is_suitable = true
        readRow(Study, study_ID) do |data|
            is_suitable = is_suitable && data.is_registration
            is_suitable = is_suitable && data.limit_num_of_mem > data.num_of_mem
        end

        is_suitable = is_suitable && updateRow?(Study, study_ID) do |study|
            study.num_of_mem += 1
        end

        result = is_suitable && createRow?(Take_Study) do |take|
            take.mem_ID = mem_ID
            take.study_ID = study_ID
        end
        return result
    end
end