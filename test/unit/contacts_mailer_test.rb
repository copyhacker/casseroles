require File.dirname(__FILE__) + '/../test_helper'

class ContactsMailerTest < ActionMailer::TestCase
  tests ContactsMailer
  def test_signup
    @expected.subject = 'ContactsMailer#signup'
    @expected.body    = read_fixture('signup')
    @expected.date    = Time.now

    assert_equal @expected.encoded, ContactsMailer.create_signup(@expected.date).encoded
  end

  def test_notify_admin
    @expected.subject = 'ContactsMailer#notify_admin'
    @expected.body    = read_fixture('notify_admin')
    @expected.date    = Time.now

    assert_equal @expected.encoded, ContactsMailer.create_notify_admin(@expected.date).encoded
  end

end
