Gem::Specification.new do |s|

  s.name              = "sixarm_ruby_email_address_validation"
  s.summary           = "SixArm » Ruby » Email address validation using RFC 822 pattern match regex regular expressions"
  s.version           = "1.2.0"
  s.author            = "SixArm"
  s.email             = "sixarm@sixarm.com"
  s.homepage          = "http://sixarm.com/"
  s.signing_key       = '/home/sixarm/keys/certs/sixarm-rsa1024-x509-private.pem'
  s.cert_chain        = ['/home/sixarm/keys/certs/sixarm-rsa1024-x509-public.pem']

  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.has_rdoc          = true
  s.files             = ['README.rdoc','INSTALL.txt','LICENSE.txt','lib/sixarm_ruby_email_address_validation.rb']
  s.test_files        = ['test/sixarm_ruby_email_address_validation_test.rb']

end
