require_relative '../lib/Crud_operations_income.rb'

class ArrayDisplayIncome
    attr_accessor :array ,:income_id, :income_amount, :income_date, :income_description, :data
    def array_income_id
        @array = []
        # b = $client.query("select id from income")
        b = $client.query("select id from Income")
            b.each do |c|
                c.each do |keys,values|
                    array.push values           
                end
            end
        @income_id = @array
        $client
    end
    def array_income_amount
        @array = Array.new
        b = $client.query("select income from Income")
        b.each do |c|
            c.each do |keys,values|
               @array.push values           
            end
        end
        @income_amount = @array
        $client
    end
    
    def array_income_description
        @array = Array.new
        b = $client.query("select description from Income")
        b.each do |c|
            c.each do |keys,values|
                @array.push values           
            end
        end
        @income_description = @array
        $client
    end
    
    def array_income_date
        @array = Array.new
        b = $client.query("select DATE_FORMAT(date,'%Y-%m-%d') from Income")
        b.each do |c|
            c.each do |keys,values|
                @array.push values          
            end
        end
        @income_date = @array
        $client
    end

    def comparison_array(id)
        quer=$client.query("select * from Income where id = #{id}")
        @array=[]
        quer.each do |data|
            @array.push(data)
        end
        @data = @array
    end 
    
    def final_display
        puts " |  Id " "| Amount " " | Date " " | Description "
        array_income_amount && array_income_date &&  array_income_description && array_income_id
        i = 0        
        while i < @income_id.length do
                    puts " +-----------------------------------------"
                    puts " |  #{@income_id[i]} " " | #{@income_amount[i]} " " | #{@income_date[i]} " " | #{@income_description[i]} " " "
            i+=1
        end    
    end
end