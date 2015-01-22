models = require '../models'

module.exports =
  readPass: (req, res, next) ->
    token = req.headers['X-Pass-Token']
    req.pass = models.Pass.get token: token
    next()

  requireAdmin: (req, res, next) ->
    isAdmin = req.pass.hasKey('superadmin') || req.pass.hasGroup('admin')
    return res.send 403, "Admin required" unless isAdmin
    next()

  requirePass: (req, res, next) ->
    isPass = !!req.pass
    return res.send 403, "Pass required" unless isPass
    next()
