require_relative '../lib/helper.rb'
require 'pry'

RSpec.describe ".Helper " do
    describe "expense_array_id" do
        obj = ArrayDisplay.new
        a = obj.array_expense_id
        b = obj.array_expense_amount
        c = obj.array_expense_description
        d = obj.array_expense_date

        it "should Create an Array" do            
            expect(obj.array).to be_kind_of(Array)
        end 

        it "should return an Array" do
            expect(obj.expense_id).to be_kind_of(Array)
            expect(obj.expense_date).to be_kind_of(Array)
            expect(obj.expense_amount).to be_kind_of(Array)
            expect(obj.expense_description).to be_kind_of(Array)
            
        end 

        if obj.expense_id.length == 0            
            it "Empty Array" do
                expect(obj.expense_id).to be_empty, "Empty array Returned no Data in Database"
            end
        else
            it "array is not empty" do
                expect(obj.expense_id.length).to be >=1
            end
        end

        if a.affected_rows ==0 && b.affected_rows == 0 && c.affected_rows == 0 && d.affected_rows==0
            it "there are no data in database" do
                expect(a.affected_rows).to be(0)
                expect(b.affected_rows).to be(0)
                expect(c.affected_rows).to be(0)
                expect(d.affected_rows).to be(0)
            end
        else 
            it "data is be taken from database" do            
                expect(a.affected_rows).to be >= 1
                expect(b.affected_rows).to be >= 1
                expect(c.affected_rows).to be >= 1
                expect(d.affected_rows).to be >= 1
            end
        end 


    end 
end
           

