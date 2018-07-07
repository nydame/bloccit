class TopicsController < ApplicationController
    def index
        @topics = Topic.all
    end

    def show
        @topic = Topic.find(params[:id])
    end

    def new
        @topic = Topic.new
    end

    def create
        @topic = Topic.new
        @topic.name = params[:topic][:name]
        @topic.description = params[:topic][:description]
        @topic.public = params[:topic][:public]
        if @topic.save
            redirect_to @topic, notice: "Topic was saved sucessfully."
        else
            flash.now[:alert] = "Error creating topic. Please try again."
            render :new
        end
    end

    def edit
        @topic =  Topic.find(params[:id])
    end

    def update
        @topic = Topic.find(params[:id])
        @topic.name = params[:topic][:name]
        @topic.description = params[:topic][:description]
        @topic.public = params[:topic][:public]
        if @topic.save
            redirect_to @topic, notice: "Topic was updated."
        else
            flash.now[:alert] = "Error updating topic. Please try again."
            render :edit
        end
    end

    def destroy
        @topic = Topic.find(params[:id])
        if @topic.destroy
            flash[:notice] = "\"#{@topic.name}\"was sucessfully deleted."
            redirect_to action: :index #same as "redirect_to topics_path"
        else
            flash.now[:alert] = "There was an error deleting the topic."
            render :show
        end
    end

end
