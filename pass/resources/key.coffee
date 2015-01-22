decorators = require '../decorators'
models     = require '../models'

# See all available keys
app.get '/keys',
  decorators.requireAdmin,
  (req, res) ->
    res.send 'All keys'


# Get all keys belonging to a certain pass
app.get '/keys',
  decorators.requirePass,
  (req, res) ->
    res.send 'All keys for pass or in pass.groups'


app.get '/groups',
  decorators.requirePass,
  (req, res) ->
    res.send 'All groups for pass'

app.get '/pass/:id',
  decorators.requirePass

app.get '/admin/