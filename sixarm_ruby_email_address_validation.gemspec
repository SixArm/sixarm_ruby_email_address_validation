Gem::Specification.new do |s|

  s.name              = "sixarm_ruby_email_address_validation"
  s.summary           = "SixArm Ruby Gem: Email address validation using RFC 822 pattern match regex regular expressions"
  s.version           = "1.0.2"
  s.author            = "SixArm"
  s.email             = "sixarm@sixarm.com"
  s.homepage          = "http://sixarm.com/"
  s.signing_key       = '/home/sixarm/keys/certs/sixarm.com.rsa.private.key.and.certificate.pem'
  s.cert_chain        = ['/home/sixarm/keys/certs/sixarm.pem']

  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.has_rdoc          = true
  s.files             = ['README.rdoc','LICENSE.txt','lib/sixarm_ruby_email_address_validation.rb']
  s.test_files        = ['test/sixarm_ruby_email_address_validation_test.rb']

end
