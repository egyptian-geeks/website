namespace :users do
  desc 'Update Counters for Users'
  task update_counters: :environment do
    users_count = User.count
    puts "=> Updating #{users_count} User"

    User.transaction do
      User.select(:id).each_with_index do |user, i|
        User.reset_counters(user.id, :posts, :comments, :reactions)
        # Progress Bar
        if i % 100 == 0 || i + 1 == users_count
          printf("\r[%-50s] #{i + 1}/#{users_count} ", '=' * ((i+1.0) / users_count * 50))
        end
      end
    end

    puts "\n"
  end
end
