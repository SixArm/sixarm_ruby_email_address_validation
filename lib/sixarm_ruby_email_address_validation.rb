=begin rdoc

= SixArm Ruby Gem: email address validation using RFC 822 pattern matching

Author:: Joel Parker Henderson, joelparkerhenderson@gmail.com
Copyright:: Copyright (c) 2006-2010 Joel Parker Henderson
License:: CreativeCommons License, Non-commercial Share Alike
License:: LGPL, GNU Lesser General Public License

Email address regex, to validate an email address using RFC 822.

This is a gem wrapper around http://tfletcher.com/lib/rfc822.rb

Example:
  if EmailAddressPattern=~'foo@bar.com'
    puts "found" 
  else
    puts "not found"
  end
  => found

To find an email address in a string, do the pattern match
then use the result, which is the match's string position:

Example of match position:
  match_position = EmailAddressPattern=~'foo@bar.com'
  => 0

  match_position = EmailAddressPattern=~'... foo@bar.com ...'
  => 4

  match_position = EmailAddressPattern=~'... hello world ...'
  => nil

To do an exact pattern match, use the EmailAddressExactPattern.
This matches the entire string from start to end; in other words,
the entire string must be one email address.

Example of exact pattern match:
  if EmailAddressExactPattern=~'foo@bar.com' 
    puts "found" 
  else
    puts "not found"
  end
  => found

  if EmailAddressExactPattern=~'... foo@bar.com ...' 
    puts "found" 
  else
    puts "not found"
  end
  => not found

The exact pattern is especialy useful to validate an email address.

Example to validate an email address:
  def valid?(email_address)
    EmailAddressExactPattern=~email_address ? true : false
  end

=end


module EmailAddressValidation

  EmailAddressQText = '[^\\x0d\\x22\\x5c\\x80-\\xff]'
  EmailAddressDText = '[^\\x0d\\x5b-\\x5d\\x80-\\xff]'
  EmailAddressAtom = '[^\\x00-\\x20\\x22\\x28\\x29\\x2c\\x2e\\x3a-\\x3c\\x3e\\x40\\x5b-\\x5d\\x7f-\\xff]+'
  EmailAddressQuotedPair = '\\x5c[\\x00-\\x7f]'
  EmailAddressDomainLiteral = "\\x5b(?:#{EmailAddressDText}|#{EmailAddressQuotedPair})*\\x5d"
  EmailAddressQuotedString = "\\x22(?:#{EmailAddressQText}|#{EmailAddressQuotedPair})*\\x22"
  EmailAddressDomainRef = EmailAddressAtom
  EmailAddressSubDomain = "(?:#{EmailAddressDomainRef}|#{EmailAddressDomainLiteral})"
  EmailAddressWord = "(?:#{EmailAddressAtom}|#{EmailAddressQuotedString})"
  EmailAddressDomain = "#{EmailAddressSubDomain}(?:\\x2e#{EmailAddressSubDomain})*"
  EmailAddressLocalPart = "#{EmailAddressWord}(?:\\x2e#{EmailAddressWord})*"
  EmailAddressSpec = "#{EmailAddressLocalPart}\\x40#{EmailAddressDomain}"

  EmailAddressPattern = /#{EmailAddressSpec}/
  EmailAddressExactPattern = /\A#{EmailAddressSpec}\z/

end
