class Supporter < ActiveRecord::Base
  validates :name, presence:   true
  validates :email, presence:   true

  after_initialize :set_default_values
  
  private

  def set_default_values
   self.photo ||= "Not Done"
  end

end
