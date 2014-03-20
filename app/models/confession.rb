class Confession < ActiveRecord::Base
  
  #ensure text is not empty
  validates_presence_of :confession_text, :message => "It's empty!  Share at least one thing... "
  
  end
