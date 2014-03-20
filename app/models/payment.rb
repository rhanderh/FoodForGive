class Payment < ActiveRecord::Base
  
  #email is mandatory
  validates_presence_of :email
  
  # email should read like an email address; this check isn't exhaustive,
# but it's a good start
  validates_format_of :email, 
    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
    :message => "doesn't look like a proper email address"

end
