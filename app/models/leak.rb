require 'pathname'
require 'tmpdir'

class Leak < ApplicationRecord
  belongs_to :repository
  enum status: %i[unchecked unsafe safe]

  def relative_file_path
    absolute = Pathname.new(file)
    tmpdir = Pathname.new(Dir.tmpdir)
    relative = absolute.relative_path_from(tmpdir)
    splited = relative.to_s.split('/')
    splited.shift

    File.join *splited
    # relative.relative_path_from(relative.parent)
  end
end
