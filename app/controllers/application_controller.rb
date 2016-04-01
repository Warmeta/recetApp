class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def regenera_manifest
# los require pueden/deben ir al inicio del documento
	 require 'tempfile'
   require 'fileutils'

    path = 'public/offline.appcache'
    temp_file = Tempfile.new('offline.appcache')
    begin
      temp_file.write("CACHE MANIFEST\n")
      temp_file.write("# v #{Time.now.to_i}\n")
      f= File.open(path, 'r')
      2.times {f.gets} 
      f.each_line do |line|
        temp_file.puts  line
      end
      temp_file.rewind
      FileUtils.mv(temp_file.path, path)
    ensure
      temp_file.close
      temp_file.unlink
    end
  end
end
