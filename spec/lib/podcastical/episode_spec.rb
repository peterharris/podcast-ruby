require 'spec_helper'

module Podcastical
  describe Episode do
    let(:url){ 'http://example.com' }
    let(:title){ 'some title' }
    let(:author){ 'author' }
    let(:date){ Date.today }
    let(:time){ Time.now }
    let(:file_size){ 1234 }
    let(:duration){ 4567 }

    subject{ Episode.new(url, title, author, date, time, file_size, duration)  }

    it 'has a url' do
      expect(subject.url).to eq(url)
    end

    it 'has a title' do
      expect(subject.title).to eq(title)
    end

    it 'has an author' do
      expect(subject.author).to eq(author)
    end

    it 'has a date' do
      expect(subject.date).to eq(date)
    end

    it 'has a time' do
      expect(subject.time).to eq(time)
    end

    it 'has a file size' do
      expect(subject.file_size).to eq(file_size)
    end

    it 'has a duration' do
      expect(subject.duration).to eq(duration)
    end

    describe '#to_s' do
      it 'outputs xml' do
        expect(subject.to_s).to eq('<item></item>')
      end
    end
  end
end
