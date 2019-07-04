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
        
        it "Inserts Data in database" do
            obj = CrudOperations.new
            allow(obj).to receive(:gets).and_return("5\n","this is a test description\n","2019-01-09\n")
            obj.input_expense
            a=obj.insert_expense
            expect(a.affected_rows).to eql(1)
        end   
        

    end
end

