require 'rails_helper'
include SessionsHelper

RSpec.describe VotesController, type: :controller do

   let(:my_user) { create(:user) }
   let(:other_user) { create(:user) }
   let(:my_topic) { create(:topic) }
   let(:user_post) { create(:post, user: other_user, topic: my_topic) }
   let(:my_vote) { Vote.create!(value: 1) }

   context "guest" do
       describe "POST up-vote" do
           it "redirects the user to the sign-in view" do
               post :up_vote, params: {post_id: user_post.id}
               expect(response).to redirect_to(new_session_path)
           end
       end

       describe "POST down-vote" do
           it "redirects the user to the sign-in view" do
               post :down_vote, params: {post_id: user_post.id}
               expect(response).to redirect_to(new_session_path)
           end
       end
   end

   context "signed-in user" do
       #first, sign in!
       before do
           create_session(my_user)
           request.env['HTTP_REFERER'] = topic_post_path(my_topic, user_post)
       end

       describe "POST up_vote" do
           it "increases the number of post votes by one if the user has not voted before" do
             votes = user_post.votes.count
             post :up_vote, params: {post_id: user_post.id}
             expect(user_post.votes.count).to eq(votes + 1)
           end

           it "does not change the number of post votes if the user tries a second vote" do
             post :up_vote, params: {post_id: user_post.id}
             votes = user_post.votes.count
             post :up_vote, params: {post_id: user_post.id}
             expect(user_post.votes.count).to eq(votes)
           end

           it "increases the sum of post votes by 1" do
             points = user_post.points
             post :up_vote, params: {post_id: user_post}
             expect(user_post.points).to eq(points + 1)
           end

           it ":back directs to post's show page" do
             request.env["HTTP_REFERER"] = topic_post_path(my_topic, user_post)
             post :up_vote, params: {post_id: user_post.id}
             expect(response).to redirect_to([my_topic, user_post])
           end

           it ":back directs to topic's show page" do
             request.env["HTTP_REFERER"] = topic_path(my_topic)
             post :up_vote, params: {post_id: user_post.id}
             expect(response).to redirect_to(my_topic)
           end
       end

       describe "POST down_vote" do
           it "increases the number of post votes by one if the user has not voted before" do
             votes = user_post.votes.count
             post :down_vote, params: {post_id: user_post.id}
             expect(user_post.votes.count).to eq(votes + 1)
           end

           it "does not change the number of post votes if the user tries a second vote" do
             post :down_vote, params: {post_id: user_post.id}
             votes = user_post.votes.count
             post :down_vote, params: {post_id: user_post.id}
             expect(user_post.votes.count).to eq(votes)
           end

           it "decreases the sum of post votes by 1" do
             points = user_post.points
             post :down_vote, params: {post_id: user_post}
             expect(user_post.points).to eq(points - 1)
           end

           it ":back directs to post's show page" do
             request.env["HTTP_REFERER"] = topic_post_path(my_topic, user_post)
             post :down_vote, params: {post_id: user_post.id}
             expect(response).to redirect_to([my_topic, user_post])
           end

           it ":back directs to topic's show page" do
             request.env["HTTP_REFERER"] = topic_path(my_topic)
             post :down_vote, params: {post_id: user_post.id}
             expect(response).to redirect_to(my_topic)
           end
       end
   end

end
