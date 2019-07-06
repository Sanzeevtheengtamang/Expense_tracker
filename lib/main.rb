require_relative '../lib/Crud_operations.rb'

obj1 = CrudOperations.new
obj2 = ArrayDisplay.new


a = obj2.array_expense_amount
# p obj2.expense_amount

# obj1.delete_expense
obj1.total_expense(obj2.expense_amount)
