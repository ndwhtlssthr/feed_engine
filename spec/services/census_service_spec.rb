require 'rails_helper'

RSpec.describe CensusService do
  let(:service) { CensusService.new }

  it "returns back census poverty json data" do
    VCR.use_cassette("poverty data", :re_record_interval => 7.days) do
      json_data = service.save_poverty_data(2010)

      expect(json_data.first.first).to eql("B17001_001E")
      expect(json_data.first.last).to eql("state")
      expect(json_data.length).to eql(53)
      json_data.each do |state_data|
        expect(state_data.length).to eql(31)
      end
    end
  end

  it "returns back education census json data" do
    VCR.use_cassette("education data", :re_record_interval => 7.days) do
      json_data = service.save_education_data(2012)
      expect(json_data.first.first).to eql("B15003_001E")
      expect(json_data.first.second).to eql("B15003_002E")
      expect(json_data.first.third).to eql("B15003_017E")
      expect(json_data.first.fourth).to eql("B15003_018E")
      expect(json_data.first[4]).to eql("B15003_022E")
      expect(json_data.first[5]).to eql("B15003_023E")
      expect(json_data.first[6]).to eql("B15003_024E")
      expect(json_data.first[7]).to eql("B15003_025E")
      expect(json_data.first.last).to eql("state")
      expect(json_data.length).to eql(53)
      json_data.each do |state_data|
        expect(state_data.length).to eql(9)
      end
    end
  end

  it "returns census migration data" do
    VCR.use_cassette("migration data", :re_record_interval => 7.days ) do
      json_data = service.save_migration_data(2010)
      expect(json_data.first.first).to eq("B07002_001E")
      expect(json_data.take(2).last[5]).to eq("27.3")
      expect(json_data.length).to eq(53)
      json_data.each do |columns|
        expect(columns.count).to eq(7)
      end
    end
  end

  it "returns back marital census json data" do
    VCR.use_cassette("marital data", :re_record_interval => 7.days) do
      json_data = service.save_marital_data(2013)
      expect(json_data.first.first).to eql("B12501_001E")
      expect(json_data.first.second).to eql("B12501_002E")
      expect(json_data.first.third).to eql("B12501_003E")
      expect(json_data.first.fourth).to eql("B12501_004E")
      expect(json_data.first.last).to eql("state")
      expect(json_data.length).to eql(53)
      json_data.each do |state_data|
        expect(state_data.length).to eql(12)
      end
    end
  end
end
