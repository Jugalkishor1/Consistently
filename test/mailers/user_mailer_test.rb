require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "weekly_summary" do
    mail = UserMailer.weekly_summary
    assert_equal "Weekly summary", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
