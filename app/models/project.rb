class Project < ApplicationRecord
  has_many :payments

  def total_progress
    progress = Payment.where(project_id: self.id).sum(:amount_in_cents)/100.00
    "$#{progress}"
  end

  def goal
    goal = self.goal_in_cents/100.00
    "$#{goal}"
  end

  def progress_as_percent
    progress = Payment.where(project_id: self.id).sum(:amount_in_cents)/100.0
    goal = self.goal_in_cents/100.00
    ((progress/goal)*100).round(2)
  end

  def expected_total
    total = self.goal_in_cents*0.009 #10% GFM Fee
    "$#{total}"
  end

  def progress_less_fees
    progress = Payment.where(project_id: self.id).sum(:amount_in_cents)*0.009
    "$#{progress.round(2)}"
  end
end
