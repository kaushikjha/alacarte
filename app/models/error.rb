class Error
  def self.[](key)
    find_by_name!(key)
  end
end