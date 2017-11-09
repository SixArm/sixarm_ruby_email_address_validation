# SixArm.com » Ruby » <br> Email address validation using RFC 822

<!--header-open-->

[![Gem Version](https://badge.fury.io/rb/sixarm_ruby_email_address_validation.svg)](http://badge.fury.io/rb/sixarm_ruby_email_address_validation)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_email_address_validation.png)](https://travis-ci.org/SixArm/sixarm_ruby_email_address_validation)
[![Code Climate](https://codeclimate.com/github/SixArm/sixarm_ruby_email_address_validation.png)](https://codeclimate.com/github/SixArm/sixarm_ruby_email_address_validation)
[![Coverage Status](https://coveralls.io/repos/SixArm/sixarm_ruby_email_address_validation/badge.svg?branch=master&service=github)](https://coveralls.io/github/SixArm/sixarm_ruby_email_address_validation?branch=master)

* Git: <https://github.com/sixarm/sixarm_ruby_email_address_validation>
* Doc: <http://sixarm.com/sixarm_ruby_email_address_validation/doc>
* Gem: <https://rubygems.org/gems/sixarm_ruby_email_address_validation>
* Contact: Joel Parker Henderson, <joel@sixarm.com>
* Changes: See CHANGES.md file.
* License: See LICENSE.md file.
* Helping: See CONTRIBUTING.md file.

<!--header-shut-->


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


<!--install-opent-->

## Install

To install using a Gemfile, add this:

    gem "sixarm_ruby_email_address_validation", ">= 2.0.2", "< 3"

To install using the command line, run this:

    gem install sixarm_ruby_email_address_validation -v ">= 2.0.2, < 3"

To install using the command line with high security, run this:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem && gem sources --add http://sixarm.com
    gem install sixarm_ruby_email_address_validation -v ">= 2.0.2, < 3" --trust-policy HighSecurity

To require the gem in your code:

    require "sixarm_ruby_email_address_validation"

<!--install-shut-->


## Pattern

To find an email address, anywhere in a string, use the `Pattern` constant.

  * If a match is anywhere in the string, then return the character position index.
  * If there's no match, then return nil.

Example:

    EmailAddressValidation::Pattern =~ "alice@example.com"
    => 0

    EmailAddressValidation::Pattern =~ "--- alice@example.com ---"
    => 4


## Pattern Exact

To find an email address, and ensure that it is the entire string, use the `PatternExact` constant.

  * If a match is the entire string, then return the character position index, which is always 0.
  * Otherwise return nil.
  
Example:

    EmailAddressValidation::PatternExact =~ "alice@example.com'
    #=> 0

    EmailAddressValidation::PatternExact =~ "--- alice@example.com ---"
    #=> nil


## Examples

The patterns are easy to use in your own code.

Example of a condition:

    text = "alice@example.com"
    if EmailAddressValidation::PatternExact =~ text
	  puts "valid"
	else
	  puts "invalid"
	end
	  
Example of a method:

    def valid?(text)
      EmailAddressValidation::PatternExact =~ text ? true : false
    end

    valid?("alice@example.com") #=> true
    valid?("alice") #=> false
	
Example of a scan which gets all the email adddresses:
	
    text = "To alice@example.com and bob@example.org and others"
    text.scan(EmailAddressValidation::Pattern)
    #=> ["alice@example.com", "bob@example.org"]

Example of a scan which iterates on each email address:

    text = "To alice@example.com and bob@example.org and others"
    text.scan(EmailAddressValidation::Pattern) do |match|
	  puts match
	end
    #=>
	alice@example.com
	bob@example.org

Example of a Rails user class:

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
