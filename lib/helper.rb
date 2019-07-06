require_relative '../lib/Crud_operations.rb'

class ArrayDisplay
    attr_accessor :array ,:expense_id, :expense_amount, :expense_date, :expense_description, :data
    def array_expense_id
        @array = []
        # b = $client.query("select id from Expense")
        b = $client.query("select id from Expense")
            b.each do |c|
                c.each do |keys,values|
                    array.push values           
                end
            end
        @expense_id = @array
        $client
    end
    def array_expense_amount
        @array = Array.new
        b = $client.query("select expense from Expense")
        b.each do |c|
            c.each do |keys,values|
               @array.push values           
            end
        end
        @expense_amount = @array
        $client
    end
    
    def array_expense_description
        @array = Array.new
        b = $client.query("select description from Expense")
        b.each do |c|
            c.each do |keys,values|
                @array.push values           
            end
        end
        @expense_description = @array
        $client
    end
    
    def array_expense_date
        @array = Array.new
        b = $client.query("select DATE_FORMAT(date,'%Y-%m-%d') from Expense")
        b.each do |c|
            c.each do |keys,values|
                @array.push values          
            end
        end
        @expense_date = @array
        $client
    end

    def comparison_array(id)
        quer=$client.query("select * from Expense where id = #{id}")
        @array=[]
        quer.each do |data|
            @array.push(data)
        end
        @data = @array
    end 
    
    def final_display
        puts " |  Id " "| Amount " " | Date " " | Description "
        array_expense_amount && array_expense_date &&  array_expense_description && array_expense_id
        i = 0        
        while i < @expense_id.length do
                    puts " +-----------------------------------------"
                    puts " |  #{@expense_id[i]} " " | #{@expense_amount[i]} " " | #{@expense_date[i]} " " | #{@expense_description[i]} " " "
            i+=1
        end    
    end
end