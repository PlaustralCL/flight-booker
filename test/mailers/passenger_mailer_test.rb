require "test_helper"

class PassengerMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end
  email = PassengerMailer.confirmation_email("Bob")

  test "confirmation email has correct fields" do

   assert_equal ["confirmation@flight-booker.com"], email.from
   assert_equal ["bob@email.com"], email.to
  end

  test "confirmation email is queued" do
    assert_emails 1 do
      email.deliver_now
    end
  end
end
