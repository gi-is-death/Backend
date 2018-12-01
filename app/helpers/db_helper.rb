module DbHelper
    def paginationTable(table)
        totalpage = table.count / 10 + 1
        return (1..totalpage).to_a
    end

    def pagingRow(table, page)
        page = page.to_i
        totalpage = table.count / 10 + 1
        if page > 0 && page <= totalpage
            pages = table.limit(10).offset(10 * (page-1))
            @result = pages
        else
            @result = {}
        end
        return @result
    end

    def readRow(table, id)
        data = table.find(id)

        if(block_given?)
            yield(data)
        end

        return data
    end

    def deleteRow?(table, id)
        data = table.find(id)
        data.destroy
        return data.destroy?
    end

    def updateRow?(table, id)
        data = table.find(id)
        yield(data)
        return data.save
    end

    def createRow?(table)
        data = table.new
        yield(data)
        return data.save
    end
end
