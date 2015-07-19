# -*- coding: utf-8 -*-
require "sixarm_ruby_email_address_validation_test"

describe EmailAddressValidation do

  describe "pattern" do

    describe "with typical" do

      it "success" do
        (EmailAddressValidation::Pattern=~'foo@bar.com').must_equal 0
      end

      it "failure" do
        (EmailAddressValidation::Pattern=~'foo').must_equal nil
      end

      describe "with chaff" do

        it "success" do
          (EmailAddressValidation::Pattern=~'... foo@bar.com ...').must_equal 4
        end

        it "failure" do
          (EmailAddressValidation::Pattern=~'... foo ...').must_equal nil
        end

      end

    end

  end

  describe "pattern exact" do

    describe "with typical" do

      it "success" do
        (EmailAddressValidation::PatternExact=~'foo@bar.com').must_equal 0
      end

    end

    describe "with chaff" do

      it "failure due to left chaff" do
        (EmailAddressValidation::PatternExact=~'... foo@bar.com').must_equal nil
      end

      it "failure due to right chaff" do
        (EmailAddressValidation::PatternExact=~'foo@bar.com ...').must_equal nil
      end

    end

  end
  
end

