require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'shouter.sqlite'
)

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :handle, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :shouts

  def self.rank_all
  	user_rank = {}
  	User.all.each do |user|
  		total_likes = 0
  		user.shouts.each do |shout|
  			total_likes += shout.likes
  		end
  		user_rank[user] = total_likes
  	end
  	sorted_user_rank=user_rank.sort_by {|key, value| value}.to_h
  	return sorted_user_rank
  end
end

class Shout < ActiveRecord::Base
  validates :user_id, presence: true
  validates :likes, numericality: { greater_or_equals_than: 0, only_integer: true }
  validates_length_of :message, :maximum=>200
  belongs_to :user
end


# #-------------- TESTS ------------------#

# describe User do
  
#   before do
#     @sharon = User.new
#     @sharon.name = "Sharon"
#     @sharon.handle = "sharebear"
#     @sharon.password = "73057163"

#   end

#   it "should be valid with correct data" do
#     expect(@sharon.valid?).to be_truthy
#   end

#   describe :name do
#     it "should be invalid with no name" do
#       @sharon.name = nil
#       expect(@sharon.valid?).to be_falsy
#     end
#   end

#   describe :handle do
#     it "should be invalid if not unique" do
#       @sharon.save
#       @karen = User.new
#       @karen.name = "karen"
#       @karen.handle = "sharebear"
#       @karen.password = "92746392729303827281" 
#       expect(@karen.valid?).to be_falsy
#     end
#   end

#   describe :handle do
#     it "should be invalid with no handle" do
#       @sharon.handle = nil
#       expect(@sharon.valid?).to be_falsy
#     end
#   end

#   describe :password do
#     it "should be invalid when not unique" do
#       @karen = User.new
#       @karen.name = "karen"
#       @karen.handle = "sharebear"
#       @karen.password = "doodles" 
#       expect(@karen.valid?).to be_falsy
#     end
#   end

#   describe :password do
#     it "should be invalid when not present" do
#       @sharon.password = nil
#       expect(@sharon.valid?).to be_falsy
#     end
#   end

# end

