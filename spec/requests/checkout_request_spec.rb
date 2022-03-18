# frozen_string_literal: true

require 'rails_helper'
# Scan these items in this order: BCDABEAAA; Verify the total price is $32.34
#  Scan these items in this order: CCCCCC; Verify the total price is $6.60 
# Scan these items in this order: ABCD; Verify the total price is $14.74 
# Scan these items in this order: ABECDE; Verify the total price is $16.94




RSpec.describe 'CheckoutController', type: :request do
  describe "#POST" do
    it 'returns results on BCDABEAAA' do
      headers = { "ACCEPT" => "application/json" }
      post "/checkout", params: {checkout_data: "BCDABEAAA"}, :headers => headers
      expect(response.body).to eq "32.34"
    end

    it 'returns results on ABCD' do
      headers = { "ACCEPT" => "application/json" }
      post "/checkout", params: {checkout_data: "ABCD"}, :headers => headers
      expect(response.body).to eq "14.74"
    end

    it 'returns results on CCCCCC' do
      headers = { "ACCEPT" => "application/json" }
      post "/checkout", params: {checkout_data: "CCCCCC"}, :headers => headers
      expect(response.body).to eq "6.6"
    end

    it 'returns results on ABECDE' do
      headers = { "ACCEPT" => "application/json" }
      post "/checkout", params: {checkout_data: "ABECDE"}, :headers => headers
      expect(response.body).to eq "14.74"
    end

  end

end
