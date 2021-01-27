class RetailChainBlueprint < Blueprinter::Base
  identifier :id

  fields \
    :name,
    :cnpj,
    :created_at,
    :updated_at
end

