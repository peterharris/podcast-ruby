module Podcastical
  class Episode
    attr_reader :url, :title, :author, :date, :time, :file_size, :duration

    def initialize(url, title, author, date, time, file_size, duration)
      @url = url
      @title = title
      @author = author
      @date = date
      @time = time
      @file_size = file_size
      @duration = duration
    end

    def to_s
      '<item></item>'
    end
  end
end

