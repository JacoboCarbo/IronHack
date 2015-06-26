require 'pry'


class Blog
	attr_accessor :all_posts

	def initialize
		@all_posts = []
		@position = 0
	end

	def add_post(post)
		@all_posts << post
	end

	def create_front_page	
		@all_posts = @all_posts.sort_by! {|post| post.date}.reverse
	end

	def publish_front_page
		print_posts
		next_page
	end

	def print_posts
		page_posts = @all_posts[@position, @all_posts.length-@position]
		page_posts.each do |v| 
			v.print end
		puts "Displaying #{@position + 1} - #{@position+3} of #{@all_posts.length} posts"
		puts "Push n Key for next page"
		puts "\n\n\n"
	end

	def next_page
		info = gets.chomp
		if info == "n"
			@position = @position + 3
		end
		if (@all_posts.length-@position)<@all_posts.length
			publish_front_page
		end
    end

end



class Post
	attr_accessor :title, :text, :date, :sponsored

	def initialize(title, text, date, sponsored)
		@title = title
		@text = text
		@date = date
		@sponsored = sponsored
	end

	def print
		puts @date
		if @sponsored
			puts "******\t##{@title}\t******"
		else
			puts @title
			puts "****************"
		end
		puts @text
		puts "----------------" 
		puts "\n"
	end
end

#--------------------------------------------------------#

my_first_post = Post.new("Title 1", "1st body", Time.new, true)
second_post = Post.new("Title 2", "Body 2", Time.new, false)
third_post = Post.new("Title 3", "Body 3", Time.new, false)
fourth_post = Post.new("Title4", "Body4", Time.new, false)
fifth_post = Post.new("Title5", "Body5", Time.new, true)
sixth_post = Post.new("Title6", "Body6", Time.new, true)
sev_post = Post.new("Title7", "Body7", Time.new, false)
eighth_post = Post.new("Title8", "Body8", Time.new, true)

my_blog = Blog.new

my_blog.add_post(my_first_post)
my_blog.add_post(second_post)
my_blog.add_post(third_post)
my_blog.add_post(fourth_post)
my_blog.add_post(fifth_post)
my_blog.add_post(sixth_post)
my_blog.add_post(sev_post)
my_blog.add_post(eighth_post)
my_blog.create_front_page
my_blog.publish_front_page

