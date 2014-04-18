require 'test_helper'

class ConfessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "a confession should have some text" do
    confession = Confession.new
    assert !confession.save
    assert !confession.errors[:confession_text].empty?
  end
  
  
  
end
