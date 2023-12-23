desc "Recreate and reseed the DB using the latest migrations."
task hard_reset: :environment do
  sh "rails db:migrate:reset db:seed"
end
