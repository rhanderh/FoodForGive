require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  
  test "a confession should have some text" do
    payment = Payment.new
    assert !payment.save
    assert !payment.errors[:email].empty?
  end
  
  test "check an email fixture that should fail" do
    payment = Payment.new
    payment.email = payments(:two).email
    assert !payment.save
    assert !payment.errors[:email].empty?
  end
  
  test "an e-mail should not have spaces" do
    payment = Payment.new
    payment.email = "My email with Spaces"
    assert !payment.save
    assert !payment.errors[:email].empty?
    puts payment.errors[:email]
    assert payment.errors[:email].include?("doesn't look like a proper email address")
  end
  
end
