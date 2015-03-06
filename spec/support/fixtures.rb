def fixture(filename)
  File.new(fixture_path + '/' + filename)
end

def fixture_path
  File.expand_path('../../fixtures', __FILE__)
end
