# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :status, presence: true
  validate :overlapping_requests?

  belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat,
    dependent: :destroy

  private

  def overlapping_requests?
    CatRentalRequest.find_by(cat_id: self.cat_id).none? do |request|
      self.start_date <= request.end_date && request.start_date <= self.end_date
    end
  end

end
