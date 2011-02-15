=begin rdoc

= SixArm Ruby Gem: email address validation using RFC 822 pattern matching

Author:: Joel Parker Henderson, joelparkerhenderson@gmail.com
Copyright:: Copyright (c) 2006-2010 Joel Parker Henderson
License:: CreativeCommons License, Non-commercial Share Alike
License:: LGPL, GNU Lesser General Public License

Email address regex, to validate an email address using RFC 822.

This is a gem wrapper around http://tfletcher.com/lib/rfc822.rb

Example:
  if EMAIL_ADDRESS_PATTERN=~'foo@bar.com'
    puts "found" 
  else
    puts "not found"
  end
  => found

To find an email address in a string, do the pattern match
then use the result, which is the match's string position:

Example of match position:
  match_position = EMAIL_ADDRESS_PATTERN=~'foo@bar.com'
  => 0

  match_position = EMAIL_ADDRESS_PATTERN=~'... foo@bar.com ...'
  => 4

  match_position = EMAIL_ADDRESS_PATTERN=~'... hello world ...'
  => nil

To do an exact pattern match, use the EMAIL_ADDRESS_EXACT_PATTERN.
This matches the entire string from start to end; in other words,
the entire string must be one email address.

Example of exact pattern match:
  if EMAIL_ADDRESS_EXACT_PATTERN=~'foo@bar.com' 
    puts "found" 
  else
    puts "not found"
  end
  => found

  if EMAIL_ADDRESS_EXACT_PATTERN=~'... foo@bar.com ...' 
    puts "found" 
  else
    puts "not found"
  end
  => not found

The exact pattern is especialy useful to validate an email address.

Example to validate an email address:
  def valid?(email_address)
    EMAIL_ADDRESS_EXACT_PATTERN=~email_address ? true : false
  end

=end


module EmailAddressValidation

  EMAIL_ADDRESS_QTEXT = '[^\\x0d\\x22\\x5c\\x80-\\xff]'
  EMAIL_ADDRESS_DTEXT = '[^\\x0d\\x5b-\\x5d\\x80-\\xff]'
  EMAIL_ADDRESS_ATOM = '[^\\x00-\\x20\\x22\\x28\\x29\\x2c\\x2e\\x3a-\\x3c\\x3e\\x40\\x5b-\\x5d\\x7f-\\xff]+'
  EMAIL_ADDRESS_QUOTED_PAIR = '\\x5c[\\x00-\\x7f]'
  EMAIL_ADDRESS_DOMAIN_LITERAL = "\\x5b(?:#{EMAIL_ADDRESS_DTEXT}|#{EMAIL_ADDRESS_QUOTED_PAIR})*\\x5d"
  EMAIL_ADDRESS_QUOTED_STRING = "\\x22(?:#{EMAIL_ADDRESS_QTEXT}|#{EMAIL_ADDRESS_QUOTED_PAIR})*\\x22"
  EMAIL_ADDRESS_DOMAIN_REF = EMAIL_ADDRESS_ATOM
  EMAIL_ADDRESS_SUB_DOMAIN = "(?:#{EMAIL_ADDRESS_DOMAIN_REF}|#{EMAIL_ADDRESS_DOMAIN_LITERAL})"
  EMAIL_ADDRESS_WORD = "(?:#{EMAIL_ADDRESS_ATOM}|#{EMAIL_ADDRESS_QUOTED_STRING})"
  EMAIL_ADDRESS_DOMAIN = "#{EMAIL_ADDRESS_SUB_DOMAIN}(?:\\x2e#{EMAIL_ADDRESS_SUB_DOMAIN})*"
  EMAIL_ADDRESS_LOCAL_PART = "#{EMAIL_ADDRESS_WORD}(?:\\x2e#{EMAIL_ADDRESS_WORD})*"
  EMAIL_ADDRESS_SPEC = "#{EMAIL_ADDRESS_LOCAL_PART}\\x40#{EMAIL_ADDRESS_DOMAIN}"

  EMAIL_ADDRESS_PATTERN = /#{EMAIL_ADDRESS_SPEC}/
  EMAIL_ADDRESS_EXACT_PATTERN = /\A#{EMAIL_ADDRESS_SPEC}\z/

end
