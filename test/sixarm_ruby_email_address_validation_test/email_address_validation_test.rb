# -*- coding: utf-8 -*-
require "sixarm_ruby_email_address_validation_test"

describe EmailAddressValidation do

  describe "pattern" do

    describe "with typical" do

      it "success" do
        expect(EmailAddressValidation::Pattern =~ "alice@example.com").must_equal 0
      end

      it "failure" do
        expect(EmailAddressValidation::Pattern =~ "alice").must_be_nil
      end

      describe "with chaff" do

        it "success with left chaff" do
          expect(EmailAddressValidation::Pattern =~ "... alice@example.com").must_equal 4
        end

        it "success with right chaff" do
          expect(EmailAddressValidation::Pattern =~ "alice@example.com ...").must_equal 0
        end        

        it "failure due to no email address" do
          expect(EmailAddressValidation::Pattern =~ "... alice ...").must_be_nil
        end

      end

    end

  end

  describe "pattern exact" do

    describe "with typical" do

      it "success" do
        expect(EmailAddressValidation::PatternExact =~ "alice@example.com").must_equal 0
      end

    end

    describe "with chaff" do

      it "failure due to left chaff" do
        expect(EmailAddressValidation::PatternExact =~ "... alice@example.com").must_be_nil
      end

      it "failure due to right chaff" do
        expect(EmailAddressValidation::PatternExact =~ "alice@example.com ...").must_be_nil
      end

      it "failure due to no email address" do
        expect(EmailAddressValidation::PatternExact =~ "... alice ...").must_be_nil
      end
              
    end

  end
  
end

