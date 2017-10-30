class Tag < ApplicationRecord
  validates :name,:content, :presence => true
  belongs_to :page

  # group tags of page by name.
  scope :grouped_by_name , -> (page) {where(page: page).group_by{|t| t.name}}
end
