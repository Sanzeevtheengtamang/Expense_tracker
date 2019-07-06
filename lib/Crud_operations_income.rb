require_relative '../lib/database_connection.rb'
require_relative '../lib/helper_income.rb'
require 'pry'
class CrudOperationsIncome
    attr_accessor :income, :descpt, :date, :id, :old_array, :sum_income
    def input_income
        puts "Enter Your Income"        
        @income = gets.chomp.to_f
        until @income != 0 
            puts "Invalid Income Amount Please Re-enter"
            @income = gets.chomp.to_f
        end        

        puts "Enter Description (Where or when "
        @descpt = gets.chomp
        puts " Enter Date in YYYY-MM-DD Format or Press Enter for Default/Current Date"
        @date = gets.chomp
    end

    def insert_income
        input_income
        if @date == ""
            @date = 'now()'
            $client.query("insert into Income (income,description,date) values ('#{@income}','#{@descpt}',#{@date})")
        else 
            $client.query("insert into Income (income,description,date) values ('#{@income}','#{@descpt}','#{@date}')")
        end
        $client
    end

    def edit_income
        obj = ArrayDisplayIncome.new
        obj.final_display
        puts "Select id to edit details"
        @id = gets.to_i
        obj.array_income_id
        if obj.income_id.include?(@id) == true
            obj.comparison_array(@id)
            @old_array = obj.data
            puts @old_array
          input_income
          if @date == ""
              @date = 'now()'
              $client.query("update Income set income= #{@income}, description= '#{@descpt}', date=#{@date} where id=#{@id}")
          else 
              $client.query("update Income set income= #{@income}, description= '#{@descpt}', date='#{@date}' where id=#{@id}")
          end
      end 
          $client
      end  

      def delete_income
        obj = ArrayDisplayIncome.new
        obj.final_display
        puts "Select id to delete details"
        @id = gets.to_i
        obj.array_income_id
        if obj.income_id.include?(@id) == true
            $client.query("Delete from Income where id=#{@id}")
            puts "#{@id}" + " " + "Deleted successfully"
            db = $client
            # $client.query("ALTER TABLE income AUTO_INCREMENT = 1")
            
        else
            puts "invlaid input Try Again !"
        end 
        return db
    end

    def total_income(array)
        @sum_income = array.reduce {|sum,n| sum+n }
        @sum_income
    end      
end


