class Event < ApplicationRecord
  validates :start_date, presence:true, :timeliness => {:on_or_after => lambda { Date.current }, :type => :date}
  validates :duration, presence:true
  validates :title, presence:true, length: {in: 5..140}
  validates :description, presence:true, length: {in: 20..1000 }
  validates :price, presence:true, numericality: {greater_than: 1, less_than_or_equal_to: 100}
  validates :location, presence:true
  has_many :attendances
  has_many :users, through: :attendances
end