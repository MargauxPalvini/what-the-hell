#require_relative "../services/face_recognition.rb"
#require_relative "../services/tmdb.rb"

class FacialRecognitionController < ApplicationController

  def search
    uploaded_file = params[:picture]
    cloudinary = upload_to_cloudinary uploaded_file.path()
    actor = FaceRecognition.call cloudinary["url"]

    if actor 
      actor = actor["actor"]
      begin
        tmdb_actor = Tmdb.actor_from_name actor
        redirect_to show_actor_path(id: tmdb_actor["id"])
      rescue
        redirect_to root_path
      end
    else
      nil
    end
  end

  private 

  def upload_to_cloudinary picture
    Cloudinary::Uploader.upload picture
  end

end
