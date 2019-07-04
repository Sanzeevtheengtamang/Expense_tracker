require_relative '../lib/database_connection.rb'
require 'pry'
class CrudOperations
    attr_accessor :expns, :descpt, :date
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
        # input_expense
        if @date == ""
            @date = 'now()'
            $client.query("insert into Expense (expense,description,date) values ('#{@expns}','#{@descpt}',#{@date})")
        else 
            $client.query("insert into Expense (expense,description,date) values ('#{@expns}','#{@descpt}','#{@date}')")
        end
        $client
    end
end