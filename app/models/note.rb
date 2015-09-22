class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :categorization
  
  validates :title , presence: true, length: { minimum: 10, maximum: 150 }
  validates :content, presence: true, length: { minimum: 20 }
  validates :categorization, :presence => true
  
end
