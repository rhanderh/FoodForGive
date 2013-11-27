class Payment < ActiveRecord::Base
  
  #email is mandatory
  validates_presence_of :email
  
  
  
  
end
