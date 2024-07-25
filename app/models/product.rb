class Product < ApplicationRecord

  after_create :send_notification

  has_one_attached :product_image


  # validates!
  validates :name, presence: true , length: {minimum:3, maximum:15}
  validates :description, presence: true,length: {minimum:100, maximum:250}
  validates :quantity, presence:true, numericality: {grater_than_or_equals: 0, less_than: 100}
  validates :price, presence:true, numericality: {grayder_than: 0}



  def send_notification
    p 'Yeni bir mehsul elave etdikde istifadecilere notification gonder'
    byebug
  end

  
end
