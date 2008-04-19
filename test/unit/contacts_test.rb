require File.dirname(__FILE__) + '/../test_helper'

class ContactsTest < ActionMailer::TestCase
  tests Contacts
  def test_signup
    @expected.subject = 'Contacts#signup'
    @expected.body    = read_fixture('signup')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Contacts.create_signup(@expected.date).encoded
  end

  def test_notify_admin
    @expected.subject = 'Contacts#notify_admin'
    @expected.body    = read_fixture('notify_admin')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Contacts.create_notify_admin(@expected.date).encoded
  end

end
