class Tag < ApplicationRecord
  validates :name,:content, :presence => true
  belongs_to :page

  scope :grouped_by_name , -> (page) {where(page: page).group_by{|t| t.name}}
end
