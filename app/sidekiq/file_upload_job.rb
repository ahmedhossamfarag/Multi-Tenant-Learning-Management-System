require "vips"

class FileUploadJob < ApplicationJob
  queue_as :default

  def perform(activity_id)
    activity = Activity.find(activity_id)
    if activity.image.attached?
      temp_file = Tempfile.create(%w[image .jbg])
      temp_file.binmode
      temp_file.write(activity.image.download)
      temp_file.rewind
      image = Vips::Image.new_from_file(temp_file.path)
      image = image.resize(300.0 / image.width)
      new_image = Tempfile.create([ "new image", ".jpg" ])
      image.write_to_file(new_image.path)
      activity.image.attach(io: File.open(new_image.path), filename: "activity #{activity_id} image")
      new_image.close
      temp_file.close
    end
  end
end
