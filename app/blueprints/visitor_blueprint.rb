class VisitorBlueprint < Blueprinter::Base
  identifier :id

  fields \
    :name,
    :avatar,
    :created_at,
    :updated_at
  
  association :retail_chain, blueprint: RetailChainBlueprint
end
