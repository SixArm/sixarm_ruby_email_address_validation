# -*- coding: utf-8 -*-
=begin rdoc
Email address validation regular expression constants.
=end

class EmailAddressValidation

  QuotedText      = Regexp.new '[^\\x0d\\x22\\x5c\\x80-\\xff]', nil, 'n'
  DomainText      = Regexp.new '[^\\x0d\\x5b-\\x5d\\x80-\\xff]', nil, 'n'
  Atom            = Regexp.new '[^\\x00-\\x20\\x22\\x28\\x29\\x2c\\x2e\\x3a-\\x3c\\x3e\\x40\\x5b-\\x5d\\x7f-\\xff]+', nil, 'n'
  QuotedPair      = Regexp.new '\\x5c[\\x00-\\x7f]', nil, 'n'
  DomainLiteral   = Regexp.new "\\x5b(?:#{QuotedText}|#{QuotedPair})*\\x5d", nil, 'n'
  QuotedString    = Regexp.new "\\x22(?:#{QuotedText}|#{QuotedPair})*\\x22", nil, 'n'
  DomainRef       = Atom
  SubDomain       = "(?:#{DomainRef}|#{DomainLiteral})"
  Word            = "(?:#{Atom}|#{QuotedString})"
  Domain          = "#{SubDomain}(?:\\x2e#{SubDomain})*"
  LocalPart       = "#{Word}(?:\\x2e#{Word})*"
  Spec            = "#{LocalPart}\\x40#{Domain}"
  Pattern         = Regexp.new "#{Spec}", nil, 'n'
  PatternExact    = Regexp.new "\\A#{Spec}\\z", nil, 'n'

end
