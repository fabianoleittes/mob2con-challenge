# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RetailChainSummary do
  let!(:first_retail_chain) { create(:retail_chain) }
  let!(:second_retail_chain) { create(:retail_chain) }
  let!(:first_visitor) { create(:visitor, retail_chain: first_retail_chain) }
  let!(:second_visitor) { create(:visitor, retail_chain: first_retail_chain) }

  describe '#process' do
    it 'returns total of the retail chains' do
      summary = described_class.process
      expect(summary[:total]).to eq(2)
    end

    it 'returns retail/visitors name of each retail chain' do
      summary = described_class.process

      first_retail_chain_summary = retail_chain_serializer(first_retail_chain)
      first_retail_chain_summary[:visitors] = [first_visitor.name, second_visitor.name].sort

      second_retail_chain_summary = retail_chain_serializer(second_retail_chain)
      second_retail_chain_summary[:visitors] = []

      retail_chains_summaries = [first_retail_chain_summary, second_retail_chain_summary]

      expect(summary[:retail_chain_visitors]).to eq(retail_chains_summaries)
    end
  end

  def retail_chain_serializer(atrrs)
    atrrs.as_json(only: %i[name cnpj]).deep_symbolize_keys
  end
end
