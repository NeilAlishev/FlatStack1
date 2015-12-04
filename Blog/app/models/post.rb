class Post < ActiveRecord::Base
	belongs_to :user
	validates :name, presence: true, length: { maximum: 50 }
	validates :content, presence: true
	belongs_to :user
	has_many :comments
end
