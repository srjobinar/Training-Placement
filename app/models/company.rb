class Company < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 50}
  validates :package, presence: true
  validates :last_date, presence: true
  validates :exam_date, presence: true
end
