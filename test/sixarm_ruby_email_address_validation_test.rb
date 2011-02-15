require 'test/unit'
require 'sixarm_ruby_email_address_validation'

class Testing < Test::Unit::TestCase

 include EmailAddressValidation

 def test_pattern_success
  assert_equal(0,EMAIL_ADDRESS_PATTERN=~'foo@bar.com')
 end

 def test_pattern_failure
  assert_equal(nil,EMAIL_ADDRESS_PATTERN=~'foo')
 end

 def test_pattern_chaff_success
  assert_equal(4,EMAIL_ADDRESS_PATTERN=~'... foo@bar.com ...')
 end

 def test_pattern_chaff_failure
  assert_equal(nil,EMAIL_ADDRESS_PATTERN=~'... foo ...')
 end

 def test_exact_pattern_success
   assert_equal(0,EMAIL_ADDRESS_EXACT_PATTERN=~'foo@bar.com')
 end

 def test_exact_pattern_failure_due_to_left_chaff
   assert_equal(nil,EMAIL_ADDRESS_EXACT_PATTERN=~'... foo@bar.com')
 end

 def test_exact_pattern_failure_due_to_right_chaff
   assert_equal(nil,EMAIL_ADDRESS_EXACT_PATTERN=~'foo@bar.com ...')
 end

end

