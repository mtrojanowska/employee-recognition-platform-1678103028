class Kudo < ApplicationRecord
  validates :receiver_id, comparison: { other_than: :giver_id, message: 'ggg' }
  # validates_comparison_of :receiver_id, other_than: :giver_id

  belongs_to :giver, class_name: 'Employee'
  belongs_to :receiver, class_name: 'Employee'

  validates :title, :content, presence: true
end
