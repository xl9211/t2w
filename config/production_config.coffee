config = require "./config"

productionConfig =
  log:
    appenders: [
      "type": "dateFile"
      "filename": "#{config.root_dir}/logs/t2w.log"
      "pattern": ".yyyy-MM-dd"
      "backups": 7
      "category": "t2w"
      "layout":
        "type": "pattern"
        "pattern": "[%d{ISO8601}] [%x{pid}] [%p] [%m]"
        "tokens":
          "pid": ->
            process.pid
    ]
    levels:
      "t2w": "INFO"
    replaceConsole: true
  mongodb:
    # "mongodb://#{user}:#{pass}@#{host}:#{port}/#{db}"
    #
    uri: "mongodb://127.0.0.1:27017/t2w"

_ = require "underscore"

module.exports = _.extend productionConfig, config