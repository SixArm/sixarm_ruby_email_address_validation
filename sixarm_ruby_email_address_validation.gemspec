# -*- coding: utf-8 -*-

Gem::Specification.new do |s|

  s.name           = "sixarm_ruby_email_address_validation"
  s.summary        = "SixArm.com » Ruby » Email address validation using RFC 822"
  s.description    = "Email address validation using RFC 822 pattern matching regular expressions"
  s.version        = "2.0.1"

  s.author         = "SixArm"
  s.email          = "sixarm@sixarm.com"
  s.homepage       = "http://sixarm.com/"
  s.licenses       = ["BSD", "GPL", "MIT", "PAL", "Various"]

  s.signing_key    =  "/opt/keys/sixarm/sixarm-rsa-4096-x509-20150314-private.pem"
  s.cert_chain     = ["/opt/keys/sixarm/sixarm-rsa-4096-x509-20150314-public.pem"]

  s.platform       = Gem::Platform::RUBY
  s.require_path   = "lib"
  s.has_rdoc       = true

  s.files = [
    ".gemtest",
    "CHANGES.md",
    "CONTRIBUTING.md",
    "LICENSE.md",
    "Rakefile",
    "README.md",
    "VERSION",
    "lib/sixarm_ruby_email_address_validation.rb",
  ]

  s.test_files = [
    "test/sixarm_ruby_email_address_validation_test.rb"
  ]

end
