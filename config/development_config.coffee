config = require "./config"

developmentConfig =
  log:
    appenders: [
      "type": "console"
      "category": "t2w"
      "layout":
        "type": "pattern"
        "pattern": "[%d{ISO8601}] [%x{pid}] [%p] [%m]"
        "tokens":
          "pid": ->
            process.pid
    ]
    levels:
      "t2w": "DEBUG"
  mongodb:
    # "mongodb://#{user}:#{pass}@#{host}:#{port}/#{db}"
    #
    uri: "mongodb://127.0.0.1:27017/t2w"


_ = require "underscore"


module.exports = _.extend developmentConfig, config
