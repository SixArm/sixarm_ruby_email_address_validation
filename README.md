# SixArm.com » Ruby » <br> Email address validation using RFC 822 pattern matching

* Doc: <http://sixarm.com/sixarm_ruby_email_address_validation/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_email_address_validation>
* Repo: <http://github.com/sixarm/sixarm_ruby_email_address_validation>
* Email: Joel Parker Henderson, <joel@sixarm.com>


## Introduction

Email address regular expression to validate an email address using RFC 822.

This is a gem wrapper around http://tfletcher.com/lib/rfc822.rb

For docs go to <http://sixarm.com/sixarm_ruby_email_address_validation/doc>

Want to help? We're happy to get pull requests.


## Install quickstart

Install:

    gem install sixarm_ruby_email_address_validation

Bundler:

    gem "sixarm_ruby_email_address_validation", "~>2.0.0"

Require:

    require "sixarm_ruby_email_address_validation"


## Example

    if EmailAddressValidation::Pattern=~"foo@bar.com"
      puts "present" 
    else
      puts "absent"
    end
    => "found"


## Pattern Match

To find an email address in a string, do the pattern match
then use the result, which is the match's string position:

Example of match position:
 
    match_position = EmailAddressValidation::Pattern=~'foo@bar.com'
    => 0

    match_position = EmailAddressValidation::Pattern=~'... foo@bar.com ...'
    => 4

    match_position = EmailAddressValidation::Pattern=~'... hello world ...'
    => nil


## Pattern Match Exact

To do a pattern match to the entire string, use the EmailAddressValidation::PatternExact.

The entire string must be one email address.

Example of pattern match:

    if EmailAddressValidation::PatternExact=~'foo@bar.com' 
      puts "present" 
    else
      puts "absent"
    end
    => found

    if EmailAddressValidation::PatternExact=~'... foo@bar.com ...' 
      puts "present" 
    else
      puts "absent"
    end
    => absent

This pattern is especialy useful to validate an email address.

Example to validate an email address:

    def valid?(email_address)
      EmailAddressValidation::PatternExact=~email_address ? true : false
    end


## Rails Validation

To add email address validation to a typical Ruby On Rails model:

    class User
      include EmailAddressValidation
      validates :email_address, :format => { :with => EmailAddressValidation::PatternExact }
    end


## Frequently Asked Questions

Q. Does this handle unusual email addresses, like foo+bar@my.com?

A. Yes. It handles all RFC email addresses. If you find an RFC email address that fails, please let us know.

Q. Why use this in a Rails app?

A. We use it to detect a potential typo during user registration, so we can prompt the user to correct it before we send a typical welcome email with a registration link. If we didn't validate the email address format, then we would have sent the welcome email to the wrong user, or into the void.

Q. Why use this to get more than one email address?

A. We use it to find typos in large databases of email addresses where it's not a business option to send the user an email. For example, proofing an existing report of 10 million users in a CSV file. We need to contact anyone with a malformed email address, so we actually call them if we have their phone number. We can't send these people an email, because the address is invalid.


## Changes

* 2012-03-17 2.0.0 Upgrade for Ruby 1.9.3, minitest/spec, improved docs, new API.
* 2011-04-24 1.2.2 Upgrade for Ruby 1.9.2 and Rails 3.0.6


## License

You may choose any of these open source licenses:

  * Apache License
  * BSD License
  * CreativeCommons License, Non-commercial Share Alike
  * GNU General Public License Version 2 (GPL 2)
  * GNU Lesser General Public License (LGPL)
  * MIT License
  * Perl Artistic License
  * Ruby License

The software is provided "as is", without warranty of any kind, 
express or implied, including but not limited to the warranties of 
merchantability, fitness for a particular purpose and noninfringement. 

In no event shall the authors or copyright holders be liable for any 
claim, damages or other liability, whether in an action of contract, 
tort or otherwise, arising from, out of or in connection with the 
software or the use or other dealings in the software.

This license is for the included software that is created by SixArm;
some of the included software may have its own licenses, copyrights, 
authors, etc. and these do take precedence over the SixArm license.

Copyright (c) 2005-2013 Joel Parker Henderson
