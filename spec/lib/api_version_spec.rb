# frozen_string_literal: true

require 'rails_helper'

describe ApiVersion do
  let(:api_version_v1) { ApiVersion.new(version: 'v1') }
  let(:api_version_v2) { ApiVersion.new(version: 'v2', default: true) }

  describe 'matches?' do
    it "returns true when the version matches the 'Accept' header" do
      expect(api_version_v1.matches?(request)).to eq true
    end

    it "returns the default version when 'default' option is specified" do
      expect(api_version_v2.matches?(request)).to eq true
    end

    def request
      double(host: 'api.dev.local',
             headers: { 'Accept' => 'application/vnd.mob2con.v1' })
    end
  end
end
