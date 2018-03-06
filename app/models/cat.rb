# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  validate :valid_sex?
  validates :color, inclusion: { in: %w(purple red orange yellow brown green black) }


  def age
    DateTime.now.year - self.birth_date.year
  end


  private

  def valid_sex?
    ["M", "F"].include?(self.sex)
  end
end
