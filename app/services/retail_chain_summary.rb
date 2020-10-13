# frozen_string_literal: true

class RetailChainSummary
  def self.process
    retail_chain_visitors = retail_chains_with_visitors.map do |retail|
      visitors = retail_chains_order(retail)
      retail_chains_attrs(retail, visitors)
    end
    { total: retail_chains_count, retail_chain_visitors: retail_chain_visitors }
  end

  def self.retail_chains_with_visitors
    RetailChain.includes(:visitors).all
  end

  def self.retail_chains_count
    RetailChain.count
  end

  def self.retail_chains_order(retail)
    retail.visitors.order(:name).pluck(:name)
  end

  def self.retail_chains_attrs(retail, visitors)
    {
      name: retail.name,
      cnpj: retail.cnpj,
      visitors: visitors
    }
  end
end
