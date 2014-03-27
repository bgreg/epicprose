class Category < ActiveRecord::Base
  belongs_to :story
  validates_presence_of :body

  def self.random_category
    Category.limit(1).offset(rand(Category.count)).first
  end
end
