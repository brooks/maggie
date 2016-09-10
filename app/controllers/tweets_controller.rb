class TweetsController < ApplicationController

  protect_from_forgery with: :null_session
  before_action :authorize_slack

  def index
    @tweets = $twitter.user_timeline
  end

  def create
    tweet = $twitter.update(params[:text][6..-1])
    if tweet.is_a? Twitter::Tweet
      response = "Success! You tweeted #{tweet.text}"
    else
      response = "Error"
    end
    render json: { text: response }.to_json
  end

  def destroy
    status_id = params[:status_id]
    $twitter.destroy_status(status_id)
  end

  private

  def authorize_slack
    redirect_to root_path unless params[:token] == ENV['SLACK_TOKEN']
  end

end
