# SixArm.com » Ruby » <br> Email address validation using RFC 822 pattern matching

* Docs: <http://sixarm.com/sixarm_ruby_email_address_validation/doc>
* Repo: <http://github.com/sixarm/sixarm_ruby_email_address_validation>
* Email: Joel Parker Henderson, <joel@sixarm.com>


## Introduction

Email address regular expression to validate an email address using RFC 822.

This is a gem wrapper around http://tfletcher.com/lib/rfc822.rb

For docs go to <http://sixarm.com/sixarm_ruby_email_address_validation/doc>

Want to help? We're happy to get pull requests.


## Quickstart

Install:

    gem install sixarm_ruby_email_address_validation

Bundler:

    gem "sixarm_ruby_email_address_validation", "=1.2.4"

Require:

    require "sixarm_ruby_email_address_validation"


## Example

    if EMAIL_ADDRESS_INNER_PATTERN=~"foo@bar.com"
      puts "found" 
    else
      puts "not found"
    end
    => "found"


## Pattern Match

To find an email address in a string, do the pattern match
then use the result, which is the match's string position:

Example of match position:
 
    match_position = EMAIL_ADDRESS_INNER_PATTERN=~'foo@bar.com'
    => 0

    match_position = EMAIL_ADDRESS_INNER_PATTERN=~'... foo@bar.com ...'
    => 4

    match_position = EMAIL_ADDRESS_INNER_PATTERN=~'... hello world ...'
    => nil


## Exact Pattern Match

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


## Rails Validation

To add email address validation to a typical Ruby On Rails model:

    class User
      include EmailAddressValidation
      validates :email_address, :format => { :with => EMAIL_ADDRESS_EXACT_PATTERN },
    end



