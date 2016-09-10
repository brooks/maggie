namespace :clean_feed do
  desc "Deletes all the tweets in your timeline"
  task :execute => :environment do
    @tweets = $twitter.user_timeline
    while @tweets.any?
    end
  end
end
