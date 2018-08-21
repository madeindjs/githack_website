require 'githack'

class Repository < ApplicationRecord
  has_many :leaks

  validates_presence_of :url
  validates_uniqueness_of :url
  validates_presence_of :framework
  validate :framework_exists

  def scan_leaks
    git = Githack::Repositories.const_get(framework).new url

    begin
      git.databases.each do |leak|
        Leak.create repository: self, content: leak.content, file: leak.file, sha: leak.sha
      end
    rescue StandardError
      # TODO: handle error in gem
    end

    begin
      git.secrets.each do |leak|
        Leak.create repository: self, content: leak.content, file: leak.file, sha: leak.sha
      end
    rescue StandardError
      # TODO: handle error in gem
    end
  end

  private

  def framework_exists
    unless Githack::Repositories.get_availables_frameworks_versions_pretty.include?(framework)
      errors.add(:framework, 'Framework is not supported')
    end
  end
end
