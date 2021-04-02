require "open-uri"

class FaceRecognition
  @url = "https://wthactorsname-tdevy3cs7a-ew.a.run.app/find_actor_by_pic"

  def self.call picture_url
    begin  
      response = URI.parse("#{@url}?url=#{picture_url}").read(read_timeout: 5)
      JSON.parse(response)
    rescue Net::ReadTimeout
      {"ERROR": "Time out"}
    end
  end

 end
