class Note < ActiveRecord::Base
  belongs_to :user
  
  validates :title , presence: true, length: { minimum: 10, maximum: 150 }
  validates :content, presence: true, length: { minimum: 20 }
end
