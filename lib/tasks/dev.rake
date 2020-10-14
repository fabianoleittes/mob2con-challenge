# frozen_string_literal: true

namespace :dev do
  desc 'Create sample data for local development'
  task prime: ['db:prepare'] do
    raise 'This task can only be run in the development environment' unless Rails.env.development?

    require 'factory_bot_rails'
    include FactoryBot::Syntax::Methods

    create_users
    create_retail_chains
  end

  def create_users
    header('Users')

    admin = create(
      :user,
      :admin,
      email: 'admin@mob2con.com.br'
    )

    puts_user(admin)

    default = create(
      :user,
      email: 'default@mob2con.com.br'
    )

    puts_user(default)
  end

  def create_retail_chains
    header('Retail Chains')

    big = create(
      :retail_chain,
      name: 'BIG'
    )

    puts_retail_chain(big)

    makro = create(
      :retail_chain,
      name: 'Makro'
    )

    puts_retail_chain(makro)
  end

  def header(msg)
    puts "\n\n*** #{msg.upcase} *** \n\n"
  end

  def puts_user(user)
    puts "#{user.email} / #{user.password}"
  end

  def puts_retail_chain(retail)
    puts retail.name
  end
end
