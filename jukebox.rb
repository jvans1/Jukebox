
class Jukebox
	include Enumerable
	attr_accessor :songs
	
	def list
		hash = Hash.new
		self.songs.each_with_index {|item, index|
  			hash[item] = index
  			}

  		puts hash.inspect
	end

	def help
		response = %{
			I'm not a very complicated machine. If you want to play a song select 'Play'.
			Otherwise if you want a list of the songs provided select 'List'.
		}
		puts response
	end

	def play
		puts "What song do you want to play?"
		song = gets.chomp.to_i
		if song < self.songs.length
			puts "Now Playing " +self.songs[song]
		else
			puts "Invalid selection here are your choices: "
			puts self.list
		end

	end
	def exit
		@on = false
	end

	def on
		@on
	end
	def on=(str)
		@on = str
	end
end

	

jukey = Jukebox.new
jukeybox = true
jukey.songs = [
"The Phoenix - 1901",
"Tokyo Police Club - Wait Up",
"Sufjan Stevens - Too Much",
"The Naked and the Famous - Young Blood",
"(Far From) Home - Tiga",
"The Cults - Abducted",
"The Phoenix - Consolation Prizes"
]

jukey.on = true

while jukey.on
	puts "Hello, I am a jukebox, what would you like to do?"
	puts "Help\nPlay\nList\nExit"
	action = gets.chomp.strip.downcase
	jukey.send(action)
end


