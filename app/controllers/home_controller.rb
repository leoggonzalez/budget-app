class HomeController < ApplicationController
  def index
    @accounts = Account.all
    
    @incomes = Entry.where("ammount >= 0")
    @incomes_totals = []
    for i in 1..6 do
      sum = 0
      @incomes.each do |item|
        sum += item.estimate(Date.today.mon + i - 1) || 0
      end
      @incomes_totals.push(sum.round(2))
    end
    
    @expenses = Entry.where("ammount < 0")
    @expenses_totals = []
    for i in 1..6 do
      sum = 0
      @expenses.each do |item|
        sum += item.estimate(Date.today.mon + i - 1) || 0
      end
      @expenses_totals.push(sum.round(2))
    end
  end
end
