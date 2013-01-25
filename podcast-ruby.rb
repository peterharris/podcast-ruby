# testing out different gems for different ideas
# unused gems have been commented out
require 'rubygems'
require 'highline/import'
require 'chronic'
# require 'mp3info'
# require 'open-uri'
# require 'uri'
# require 'net/http'
# require 'pp'

  lastEntry = ask "Last entry? (y or n): "

  # continues with prompts if not last entry
  if lastEntry == 'n' #continue

    title = ask "Title text: "
    link = ask "Media link: "
    author = ask "Speaker (shortcuts for usual speakers are: D or d - Doc Shell, j or J - Jimmy Hayes, dr or Dr - Dr. David Keyser): "
    serviceDate = ask "Date of service: "
    serviceTime = ask "Time of service (shortcuts for common times are: 8 - 8:30am, 10 - 10:30am, 7 - 7:00pm): "
    mediaLength = ask "Size of media file?: "
    duration = ask "Duration: "

    # author shortcut
    # if author is not listed, enter full name
    if author == "d" or author == "D"
        author = "Doc Shell"
      elsif author == "j" or author == "J"
        author = "Jimmy Hayes"
      elsif author == "dr" or author == "Dr"
        author = "Dr. David Keyser"
    end

    # service time shortcut
    # if service time is not listed, enter full time
    if serviceTime == "8"
        serviceTime = "8:30am"
      elsif serviceTime == "10"
        serviceTime = "10:30am"
      elsif serviceTime == "7"
        serviceTime = "7:00pm"
    end

    # modify link to correct format
    link["ftp://christ-chapel.org"] = "http:"

    # parses serviceDay from serviceDate input and converts it to full name of day
    serviceDay = Chronic::parse(serviceDate)
    serviceDay = serviceDay.strftime("%A")
    # parse serviceDate input to actual date
    pubDate = Chronic::parse(serviceDate)
    # parse serviceTime input to actual time
    pubTime = Chronic::parse(serviceTime)

    # checks to see if link ends with ".mp3"
    # outputs audio entry if true
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

    # checks to see if link ends with ".m4v"
    # outputs video entry if true
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

  # closes out channel and rss tags
  elsif lastEntry == 'y' #close
    File.open("/Users/peter/Desktop/podcast.xml", "a") do |f|
      f.puts "    </channel>"
      f.puts "</rss>"
    end
  end

$end
