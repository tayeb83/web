# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#
# Blog seeds

unless oriol = User.find_by_name('Oriol Gual')
  oriol = Factory(:user, name: 'Oriol Gual', email: 'oriol@codegram.com', position: 'Lead developer', github: 'oriolgual', twitter: 'oriolgual')
  oriol.user_tokens << UserToken.new(user: oriol, provider: 'twitter', uid: '128157474')
  oriol.save
end

unless txus = User.find_by_name('Josep M. Bach')
  txus = Factory(:user, name: 'Josep M. Bach', email: 'txus@codegram.com', position: 'Lead developer', github: 'txus', twitter: 'txustice')
  txus.user_tokens << UserToken.new(user: txus, provider: 'twitter', uid: '6895722')
  txus.save
end

unless josepjaume = User.find_by_name('Josep Jaume Rey')
  josepjaume = Factory(:user, name: 'Josep Jaume Rey', email: 'josepjaume@codegram.com', position: 'Lead developer', github: 'josepjaume', twitter: 'josepjaume')
  josepjaume.user_tokens << UserToken.new(user: josepjaume, provider: 'twitter', uid: '6965262')
  josepjaume.save
end

unless marc = User.find_by_name('Marc Riera')
  marc = Factory(:user, name: 'Marc Riera', email: 'marc@codegram.com', position: 'Front-end developer', github: 'mrc2407', twitter: 'mrc2407')
  marc.user_tokens << UserToken.new(user: marc, provider: 'twitter', uid: '15055477')
  marc.save
end

unless roger = User.find_by_name('Roger Bacardit')
  roger = Factory(:user, name: 'Roger Bacardit', email: 'roger@codegram.com', position: 'Lead designer', github: '', twitter: 'ruxii')
  roger.user_tokens << UserToken.new(user: roger, provider: 'twitter', uid: '7086462')
  roger.save
end


# Migrating old posts
# Factory(:post,
#         title: 'Date validation with Rails 3',
#         tagline: 'Effortless date validation for your Rails 3 application, ActiveModel style',
#         body: File.read('db/seeds/date-validation-with-rails-3.md'),
#         created_at: Date.parse('2010-04-30'),
#         picture: File.open('db/seeds/images/date-validation-with-rails-3.jpg'),
#         author: oriol)
# 
# Factory(:post,
#         title: 'Released Acts as Decimal',
#         tagline: 'Treat your integers as if they were decimals, preserving floating point precision',
#         body: File.read('db/seeds/released-acts-as-decimal.md'),
#         created_at: Date.parse('2010-06-23'),
#         picture: File.open('db/seeds/images/released-acts-as-decimal.png'),
#         author: txus)
# 
# unless Rails.env.production?
# 
#   stendhal_post = Factory(:post,
#                           title: 'Stendhal 0.1.2 released',
#                           body: File.read('db/seeds/stendhal.md'),
#                           created_at: Date.parse('2010-10-31'),
#                           author: txus)
# 
#   hijacker_post = Factory(:post,
#                            title: 'Introducing hijacker: spy on your ruby objects!',
#                            body: File.read('db/seeds/hijacker.md'),
#                            created_at: Date.parse('2010-11-21'),
#                            author: josepjaume)
# 
#   micetrap_post = Factory(:post,
#                           title: 'Micetrap: catch evil hackers on the fly',
#                           body: File.read('db/seeds/micetrap.md'),
#                           created_at: Date.parse('2011-01-06'),
#                           author: oriol)
# 
#   micetrap_post = Factory(:post,
#                           title: 'Micetrap: catch evil hackers on the fly',
#                           body: File.read('db/seeds/micetrap.md'),
#                           created_at: Date.parse('2011-01-06'),
#                           author: marc)
# 
#   micetrap_post = Factory(:post,
#                           title: 'Micetrap: catch evil hackers on the fly',
#                           body: File.read('db/seeds/micetrap.md'),
#                           created_at: Date.parse('2011-01-06'),
#                           author: roger)
# 
# 
#   6.times do
#     Factory(:project)
#   end
#   6.times do
#     Factory(:project_without_screenshot)
#   end
#   Factory(:project, :promoted => true)
#   Factory(:project_without_screenshot, :promoted => true)
# end
