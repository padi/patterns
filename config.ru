# Start with: shotgun
# Under Windows: rackup  (CTRL+C and restart on each change)

# rubocop:disable Style/StringLiterals

ROUTES = {
  "GET" => {
  }
}

def get(path, &block)
  ROUTES["GET"][path] = block
end

get('/hi') do
  'awesome'
end

get('/hello') do
  'something else'
end

run -> (env) {
  block = ROUTES["GET"][env['REQUEST_PATH']]
  if block
    [200, { "Content-Type" => "text/html" }, [block.call]]
  else
    [400, { "Content-Type" => "text/html" }, ["Not found."]]
  end
}
