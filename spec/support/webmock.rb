def a_get(path)
  a_request(:get, AcceptOn::Request::URLS[:production] + path)
end

def a_post(path)
  a_request(:post, AcceptOn::Request::URLS[:production] + path)
end

def stub_delete(path)
  stub_request(:delete, AcceptOn::Request::URLS[:production] + path)
end

def stub_get(path)
  stub_request(:get, AcceptOn::Request::URLS[:production] + path)
end

def stub_post(path)
  stub_request(:post, AcceptOn::Request::URLS[:production] + path)
end

def stub_put(path)
  stub_request(:put, AcceptOn::Request::URLS[:production] + path)
end
