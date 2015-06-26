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
	 
		@all_posts = all_posts.sort_by! {|post, date| post.date}.reverse
	
	end

	def publish_front_page
		page_posts = @all_posts.slice(@position, @position + 3)
		page_posts.each do |v|
			puts v.title
			puts v.date
			puts "****************"
			puts v.text
			puts "----------------" 
			puts "Displaying #{@position + 1} - #{@position + 3} of #{@all_posts.length} posts"
			puts
			puts "Push N Key for next page"
				info = gets.chomp
					if info == "n"
					turnpage
					@position = @position + 3
					end

		end
	end

	def pgcount	
		pgcount = (@all_posts.length) / 3
	end
	def turnpage
	
		puts " "
        posts_to_print = @all_posts.slice(@position, @position + 3)
        posts_to_print.each do |post|
             puts post.date, post.title, post.text
         end
    end
end



class Post
	attr_accessor :title
	attr_accessor :text
	attr_accessor :date

	def initialize(title, text, date)
		
		@title = title
		@text = text
		@date = date
	end
	def namechange
			@title = "*******" + "#{@title}" + "******"
		end
end

# class Sponsored < Post
# 	def initialize(title, text, date)
# 		@title = title
# 		@text = text
# 		@date = date
# 	end
# 	def namechange
# 		@title = "*******" + "#{@title}" + "******"
# 	end
# end



my_first_post = Post.new("Title 1", "1st body", Time.new)
second_post = Post.new("Title 2", "Body 2", Time.new)
third_post = Post.new("Title 3", "Body 3", Time.new)
fourth_post = Post.new("Title4", "Body4", Time.new)
fifth_post = Post.new("Title5", "Body5", Time.new)
sixth_post = Post.new("Title6", "Body6", Time.new)
sev_post = Post.new("Title7", "Body7", Time.new)
eighth_post = Post.new("Title8", "Body8", Time.new)

fourth_post.namechange

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