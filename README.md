podcastical
===========

This is a personal project for a podcast I manage.

Usage
-----

This gem provides a command-line interface for modifying a podcast RSS document!

    podcastical create podcast.xml
    # => Generated empty iTunes podcast RSS file "podcast.xml"

    podcastical add podcast.xml
    > Enter url to media file: http://whatever/whatever.mp3
    > Enter title: An Amazing Podcast Episode
    > Enter author: Jeter Hayris
    > Enter date: 1/2/13
    > Enter time: 8:00 AM
    # => Podcast has been updated to include this new episode!
    > Would you like to add another? (y/n): n

    podcastical rm podcast.xml
    # 1. An Amazing Podcast Episode (1/2/13 at 8:00 AM)
    # 2. Some Other Brilliance (1/5/13 at 6:00 PM)
    > Which episode would you like to remove? (enter number): 1
    # => Episode 1 has been removed!
    > Would you like to remove another? (y/n): n

### Note about shortcuts

The original script includes the ability to enter shortcuts for speakers and
times. This feature, while very helpful, seems to couple the script very tightly
to our specific usage. Perhaps we could provide some way to "configure" the
script to define shortcuts... Just speculating. This could certainly be a future
feature.
