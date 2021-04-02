#require_relative "../services/face_recognition.rb"
#require_relative "../services/tmdb.rb"

class FacialRecognitionController < ApplicationController

  def search
    uploaded_file = params[:picture]
    cloudinary = upload_to_cloudinary uploaded_file.path()
    puts "*"*50
    actor = FaceRecognition.call cloudinary["url"]

    if actor 
      actor = actor["actor"]
      tmdb_actor = Tmdb.actor_from_name actor
      puts tmdb_actor
      redirect_to show_actor_path(id: tmdb_actor["id"])
    else
      nil
    end

    puts "*"*50
  end

  private 

  def upload_to_cloudinary picture
    Cloudinary::Uploader.upload picture
  end

end
