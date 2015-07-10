# SixArm.com » Ruby » <br> Email address validation using RFC 822

<!--HEADER-OPEN-->

[![Code Climate](https://codeclimate.com/github/SixArm/sixarm_ruby_email_address_validation.png)](https://codeclimate.com/github/SixArm/sixarm_ruby_email_address_validation)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_email_address_validation.png)](https://travis-ci.org/SixArm/sixarm_ruby_email_address_validation)

* Git: <https://github.com/sixarm/sixarm_ruby_email_address_validation>
* Doc: <http://sixarm.com/sixarm_ruby_email_address_validation/doc>
* Gem: <https://rubygems.org/gems/sixarm_ruby_email_address_validation>
* Contact: Joel Parker Henderson, <joel@sixarm.com>
* Changes: See CHANGES.md file.
* License: See LICENSE.md file.
* Helping: See CONTRIBUTING.md file.

<!--HEADER-SHUT-->


## Introduction

Email address regular expression to validate an email address using RFC 822.

The original PHP code is by Cal Henderson, see http://iamcal.com/publish/articles/php/parsing_email/

Translated to Ruby by Tim Fletcher, with changes suggested by Dan Kubb, see http://tfletcher.com/lib/rfc822.rb

For docs go to <http://sixarm.com/sixarm_ruby_email_address_validation/doc>

Want to help? We're happy to get pull requests.

Related links:

  * RFC 2822: http://tools.ietf.org/html/rfc2822
  * Dominic Sayers is_email: http://isemail.info/
  * Wikipedia email address: http://en.wikipedia.org/wiki/Email_address
  * Email address validator with parsing expression grammar: https://github.com/larb/email_address_validator
  * ActiveModel gem to delegate to Mail gem: https://github.com/codyrobbins/active-model-email-validator


<!--INSTALL-OPEN-->

## Install

To install using a Gemfile, add this:

    gem "sixarm_ruby_email_address_validation", ">= 2.0.1, < 3"

To install using the command line, run this:

    gem install sixarm_ruby_email_address_validation -v ">= 2.0.1, < 3"

To install using the command with high security, run this:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem && gem sources --add http://sixarm.com
    gem install sixarm_ruby_email_address_validation -v ">= 2.0.1, < 3" --trust-policy HighSecurity

To require the gem in your code:

    require "sixarm_ruby_email_address_validation"

<!--INSTALL-SHUT-->


## Example

    if EmailAddressValidation::Pattern=~"foo@bar.com"
       ...
    end


## Pattern Match

To find an email address in a string, do the pattern match
then use the result, which is the match's string position:

Example of match position:

    EmailAddressValidation::Pattern=~'foo@bar.com'
    => 0

    EmailAddressValidation::Pattern=~'... foo@bar.com ...'
    => 4

    EmailAddressValidation::Pattern=~'... hello world ...'
    => nil


## Pattern Match Exact

To do a pattern match to the entire string, use the EmailAddressValidation::PatternExact.

The entire string must be one email address.

Example of pattern match:

    if EmailAddressValidation::PatternExact=~'foo@bar.com'
    #=> truthy

    if EmailAddressValidation::PatternExact=~'... foo@bar.com ...'
    #=> falsey

This pattern is especialy useful to validate an email address.

Example to validate an email address:

    def valid?(email_address)
      EmailAddressValidation::PatternExact=~email_address ? true : false
    end


## Rails Validation (optional)

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
