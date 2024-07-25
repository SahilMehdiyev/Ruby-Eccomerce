class Category < ApplicationRecord

  after_save :after_save_method
  before_save :before_save_method

  def after_saved_method
    p 'after method calisti.'
    byebug
  end


  def before_save_method
    p 'before method calisti.'
    byebug
  end

end
