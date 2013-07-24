# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
%w( max paul john ).each do |x|
  User.create(:email => x, :password => x)
end


%w( run play tennis ).each do |activity| 
  %w( 3.0 2.2 4 ).each do |value|
    %w( miles ).each do |units|
      @user = User.all.sample(1).first
      @user.exercises.create(:activity => activity, :value => value, :units => units, :date => Date.today)
    end
  end
end
