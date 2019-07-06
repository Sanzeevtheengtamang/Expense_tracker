require_relative '../lib/Crud_operations.rb'
require_relative '../lib/Crud_operations_income.rb'


obj1 = CrudOperations.new
obj2 = ArrayDisplay.new
obj3 = CrudOperationsIncome.new
obj4 = ArrayDisplayIncome.new


# a = obj2.array_expense_amount
# p obj2.expense_amount
obj1.filter

# obj1.delete_expense
# obj1.total_expense(obj2.expense_amount)

def expense_menu(obj1,obj2)
    puts "1. Insert Expense\n 2.Edit Expense\n 3.Delete Expense\n 4.View Expense\n 5.Exit"
    pick_expns = gets.chomp.to_i
    case pick_expns
    when 1
        obj1.insert_expense
    when 2
        obj1.edit_expense
    when 3
        obj1.delete_expense
    when 4
        obj2.final_display
    when 5
        puts "thank you"
        exit
    else
        puts "invalid input Try Again!"
        expense_menu(obj1,obj2)
    end
end

def income_menu(obj3,obj4)
    puts "1. Insert Expense\n 2.Edit Expense\n 3.Delete Expense\n 4.View Expense\n 5.Exit"
    pick_expns = gets.chomp.to_i
    case pick_expns
    when 1
        obj3.insert_income
    when 2
        obj3.edit_income
    when 3
        obj3.delete_income
    when 4
        obj4.final_display
    when 5
        puts "thank you"
        exit
    else
        puts "invalid input Try Again!"
        expense_menu(obj1,obj2)
    end
end

def total(obj1,obj2,obj3,obj4)
    obj2.array_expense_amount
    obj4.array_income_amount
    c = obj2.expense_amount
    d = obj4.income_amount
    a = obj1.total_expense(c)
    b = obj3.total_income(d)
    if (a > b)
        total = a - b 
        puts "You have Spend #{total} More than your Income"
    else  
        total = b - a
        puts "You have #{total} money left after your expenses"
    end

end

puts "Welcome To Expense Tracker"
puts "Pick What Do you want to see\n 1. Expense\n 2. Income\n 3. Total\n 4.Exit"
choose = gets.chomp.to_i
case choose
when 1
    puts "Expense Menu"
    expense_menu(obj1,obj2)
when 2
    puts "Income Menu"
    income_menu(obj3,obj4)
when 3
    puts "Total"
    total(obj1,obj2,obj3,obj4)
when 4
    puts "Thank You!"
    exit 
else 
    abort("Invalid Input")
end
    