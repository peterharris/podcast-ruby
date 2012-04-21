# <item>
#     <title>Rest of Faith</title>
#     <link>http://christ-chapel.org/Audio/2012-04-01%20Rest%20of%20Faith%208.30%20am%20-%20Doc%20Shell.mp3</link>
#     <itunes:author>Doc Shell</itunes:author>
#     <description>8:30am Service</description>
#     <itunes:summary>Sunday 8:30am Service</itunes:summary>
#     <enclosure url="http://christ-chapel.org/Audio/2012-04-01%20Rest%20of%20Faith%208.30%20am%20-%20Doc%20Shell.mp3" 
#		length="67450745" type="audio/mpeg"/>
#     <guid>http://christ-chapel.org/Audio/2012-04-01%20Rest%20of%20Faith%208.30%20am%20-%20Doc%20Shell.mp3</guid>
#     <pubDate>Sun, 01 Apr 2012 08:30:00 CST</pubDate>
#     <itunes:duration>46:50</itunes:duration>
#     <itunes:keywords>Christ Chapel, Doc Shell</itunes:keywords>
#     <category>Podcasts</category>
#     <itunes:explicit>no</itunes:explicit>
# </item>

#Media file link: 
#ftp://christ-chapel.org//christ-chapel.org/Audio/2012-04-04%20Romans%20Pt%2011%207.00%20pm%20-%20Jimmy%20Hayes,%20David%20Keyser.mp3
require 'rubygems'
require 'highline/import'
require 'chronic'
require 'mp3info'
require 'open-uri'
require 'uri'
require 'net/http'
require 'pp'

	lastEntry = ask "Last entry? (y or n): "
		
	if lastEntry == 'n' #continue
		
		title = ask "Title text: "
		link = ask "Media link: "
		author = ask "Speaker (D or d - Doc Shell, j or J - Jimmy Hayes, dr or Dr - Dr. David Keyser): "
		serviceDate = ask "Date of service: "	
		serviceDay = Chronic::parse(serviceDate)
		serviceDay = serviceDay.strftime("%A")
		serviceTime = ask "Time of service (8 - 8:30am, 10 - 10:30am, 7 - 7:00pm): "
		mediaLength = ask "Size of media file?: "
		duration = ask "Duration: "
		
		
		if author == "d" or author == "D"
				author = "Doc Shell"
			elsif author == "j" or author == "J"
				author = "Jimmy Hayes"
			elsif author == "dr" or author == "Dr"
				author = "Dr. David Keyser"
		end
		
		if serviceTime == "8"
				serviceTime = "8:30am"
			elsif serviceTime == "10"
				serviceTime = "10:30am"
			elsif serviceTime == "7"
				serviceTime = "7:00pm"
		end	
		
		link["ftp://christ-chapel.org"] = "http:"
		pubDate = Chronic::parse(serviceDate)
		pubTime = Chronic::parse(serviceTime)
		
		
		if link.include? '.mp3' #Audio entry
			File.open("/Users/peter/Desktop/podcast.xml", "a") do |f| 
				f.puts "    <item>"
				f.puts "        <title>#{title}</title>"
				f.puts "        <link>#{link}</link>"
				f.puts "        <itunes:author>#{author}</itunes:author>"
				f.puts "        <description>#{serviceTime} Service</description>"
				f.puts "        <itunes:summary>#{serviceDay} #{serviceTime} Service</itunes:summary>"
				f.puts "        <enclosure url=\"#{link}\" length=\"#{mediaLength}\" type=\"audio/mpeg\"/>"
				f.puts "        <guid>#{link}</guid>"
				f.puts "        <pubDate>#{pubDate.strftime("%a, %d %b %Y")} #{pubTime.strftime("%H:%M:%S")} CST</pubDate>"
				f.puts "        <itunes:duration>#{duration}</itunes:duration>"
				f.puts "        <itunes:keywords>Christ Chapel, #{author}</itunes:keywords>"
				f.puts "        <category>Podcasts</category>"
				f.puts "        <itunes:explicit>no</itunes:explicit>"
				f.puts "    </item>"
				f.puts
			end
		
		elsif link.include? '.m4v' #Video entry
			File.open("/Users/peter/Desktop/podcast.xml", "a") do |f|			 
				f.puts "    <item>"
				f.puts "        <title>#{title}</title>"
				f.puts "        <link>#{link}</link>"
				f.puts "        <itunes:author>#{author}</itunes:author>"
				f.puts "        <description>#{serviceTime} Service</description>"
				f.puts "        <itunes:summary>#{serviceDay} #{serviceTime} Service</itunes:summary>"
				f.puts "        <enclosure url=\"#{link}\" length=\"#{mediaLength}\" type=\"video/x-m4v\"/>"
				f.puts "        <guid>#{link}</guid>"
				f.puts "        <pubDate>#{pubDate.strftime("%a, %d %b %Y")} #{pubTime.strftime("%H:%M:%S")} CST</pubDate>"
				f.puts "        <itunes:duration>#{duration}</itunes:duration>"
				f.puts "        <itunes:keywords>Christ Chapel, #{author}</itunes:keywords>"
				f.puts "        <category>Podcasts</category>"
				f.puts "        <itunes:explicit>no</itunes:explicit>"
				f.puts "    </item>"
				f.puts
			end
		else
			puts "You have not entered a valid media type!"
			return self
		end
		
	elsif lastEntry == 'y' #close
		File.open("/Users/peter/Desktop/podcast.xml", "a") do |f|			 
			f.puts "    </channel>"
			f.puts "</rss>"
		end
	end
	
$end	
