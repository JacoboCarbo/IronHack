require 'date'
require './post'
require 'colorize'
require 'pry'
require 'io/console'
PPP = 3 # POSTS PER PAGE

class Blog

	def initialize()
		@all_posts = []
		@page = 1
		@total_pages = 0
		@post
	end

	def create_front_page(post)
		@all_posts.push(post)
	end

	def print_page(page)
		@total_pages = (@all_posts.length/PPP)+1
		page_post = page*3-3
		current_posts = @all_posts[page_post..page_post+2]

		current_posts.each do |post|

			puts post.get_date 				# Date

			if post.get_sponsor	# Sponsored?
				puts "****** " + post.get_title + " ******"
			else
				puts post.get_title
			end

			puts "******************************"
			puts post.get_text				# Text
			puts "------------------------------"
			puts "\n"
			print "Page:\t\t"
			(1..@total_pages).each do |page|
				if page == @page
					print page.to_s.colorize(:green)
				end
			end
			puts "Use ARROW KEYS and ENTER to navigate"
			puts "\n\n\n\n"
		end

	end


	def publish_front_page

		print_page(@page)
 		input = gets

 		while input!= "q" # ESCUCHA
 			if input === "\e[C\n"
 				@page += 1
 			elsif input === "\e[D\n"
 				@page -= 1
 			else
 				puts "Use right and left arrow keys to navigate. \n"
 			end
 			system("clear")
 			print_page(@page)
 			input = gets

		end						   # DEJA DE ESCUCHAR
	end


end

# Main #
blog = Blog.new

blog.create_front_page(Post.new("1. ", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", true))
blog.create_front_page(Post.new("2. ", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", false))
blog.create_front_page(Post.new("3. ", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", false))
blog.create_front_page(Post.new("4. ", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", false))
blog.create_front_page(Post.new("5. ", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", false))
blog.create_front_page(Post.new("6. ", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", false))
blog.create_front_page(Post.new("7. ", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", false))
blog.create_front_page(Post.new("8. ", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", false))

blog.publish_front_page
c = blog.gets

