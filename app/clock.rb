require 'clockwork'
require File.expand_path('../../config/boot', __FILE__)
require File.expand_path('../../config/environment', __FILE__)

module Clockwork
  handler do |job|
    puts "Running #{job}"
  end


  every(2.seconds, 'rake get rate'){
    `rake get:rate`
  }


  every(10.hours, 'rake clear olditems'){
      `rake clear:olditems`
  }

  every(20.days, 'rake send sendemail'){
    `rake send:email`
  }

  #
  # every(1.day, 'rake clear olditems', :at => ['12:00', '18:00']){
  #     `rake clear:olditems`
  # }


end
