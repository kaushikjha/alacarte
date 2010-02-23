class Error < ActiveRecord::Base
  def self.[](key)
    find_by_name!(key)
  end
end