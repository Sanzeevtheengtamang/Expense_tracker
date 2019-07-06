require_relative '../lib/database_connection.rb'
require_relative '../lib/helper.rb'
require 'pry'
class CrudOperations
    attr_accessor :expns, :descpt, :date, :id, :old_array
    def input_expense
        puts "Enter Your Expense"        
        @expns = gets.chomp.to_f
        until @expns != 0 
            puts "Invalid Expense Amount Please Re-enter"
            @expns = gets.chomp.to_f
        end        

        puts "Enter Description (Where or when "
        @descpt = gets.chomp
        puts " Enter Date in YYYY-MM-DD Format or Press Enter for Default/Current Date"
        @date = gets.chomp
    end

    def insert_expense
        input_expense
        if @date == ""
            @date = 'now()'
            $client.query("insert into Expense (expense,description,date) values ('#{@expns}','#{@descpt}',#{@date})")
        else 
            $client.query("insert into Expense (expense,description,date) values ('#{@expns}','#{@descpt}','#{@date}')")
        end
        $client
    end

    def edit_expense
        obj = ArrayDisplay.new
        obj.final_display
        puts "Select id to edit details"
        @id = gets.to_i
        obj.array_expense_id
        if obj.expense_id.include?(@id) == true
            obj.comparison_array(@id)
            @old_array = obj.data
            puts @old_array
          input_expense
          if @date == ""
              @date = 'now()'
              $client.query("update Expense set expense= #{@expns}, description= '#{@descpt}', date=#{@date} where id=#{@id}")
          else 
              $client.query("update Expense set expense= #{@expns}, description= '#{@descpt}', date='#{@date}' where id=#{@id}")
          end
      end 
          $client
      end  

      def delete_expense
        obj = ArrayDisplay.new
        obj.final_display
        puts "Select id to delete details"
        @id = gets.to_i
        obj.array_expense_id
        if obj.expense_id.include?(@id) == true
            $client.query("Delete from Expense where id=#{@id}")
            puts "#{@id}" + " " + "Deleted successfully"
            db = $client
            # $client.query("ALTER TABLE Expense AUTO_INCREMENT = 1")
            
        else
            puts "invlaid input Try Again !"
        end 
        return db
    end

    def total_expense(array)
        total_expense = array.reduce {|sum,n| sum+n }
        p total_expense
    end      
end


