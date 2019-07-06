require_relative '../lib/Crud_operations.rb'
require 'pry'

RSpec.describe "Crud Operations" do
    describe "#input_expense" do
        it "it validates whether the input is valid" do
            obj = CrudOperations.new
            allow(obj).to receive(:gets).and_return("1\n","this is a test description\n","2019-01-09\n")
            obj.input_expense
            expect(obj.expns).to be_kind_of(Float)
            expect(obj.descpt).to be_kind_of(String)
            expect(obj.date).to be_kind_of(String)
            expect(obj.expns).to eql(1.0)
            expect(obj.descpt).to eql("this is a test description")
            expect(obj.date).to eql("2019-01-09")
        end
    end 
    
    describe "Insert Expense" do     
        it "Inserts Data in database" do
            obj = CrudOperations.new
            allow(obj).to receive(:gets).and_return("5\n","this is a test description\n","2019-01-09\n")
            a=obj.insert_expense
            expect(a.affected_rows).to eql(1)
        end
    end 
    
    describe "Edit Expense" do     
        it "Edit's Data in database" do
            obj = CrudOperations.new
            a =obj.edit_expense
            puts obj.id

            obj1 = ArrayDisplay.new
            obj1.comparison_array(obj.id)
                        
            data1 = obj1.data
            data2= obj.old_array
            expect(data1).not_to match_array(data2)
            expect(a.affected_rows).to eql(1)
        end
    end 
    
    describe "Delete Expense" do     
        it "Deltes Data according to id in database" do
            obj = CrudOperations.new
            a =obj.delete_expense
            puts obj.id
            expect(a.affected_rows).to eql(1)
        end
    end 

    describe "Total Expense" do
        it "should Display sum from Array" do
            array= [1,2,3,4,5]
            obj = CrudOperations.new
            a = obj.total_expense(array)
            expect(a).to eql(15)
        end 
    end            

end

