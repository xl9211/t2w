Twit = require 'twit'
log4js = require 'log4js'

NODE_ENV = process.env.NODE_ENV || 'production'
if NODE_ENV is "development"
  config = require "./config/development_config"
if NODE_ENV is "production"
  config = require "./config/production_config"

log4js.configure config.log
logger = log4js.getLogger 't2w'

logger.info NODE_ENV

t = new Twit
  consumer_key: 'dxPlBUNhP6MHuOTfU0L5NA',
  consumer_secret: 'PxKjZYQkv6RBvOwo2VMGCNVk4C40BD4dTXFsznRY',
  access_token: '17145920-tfySfKA4os42W2VTjd9jKBQB2HnXP5nZBZHP14lko',
  access_token_secret: 'otqv1kASMmDmHJqQoHFFDPYuhHPRdjJZoYAsvMwE'

# 获取列表
getLists = ->
  t.get 'lists/list', (error, reply) ->
    if error
      logger.error error
    else
      for list in reply
        getListMembers list.id_str

# 获取列表成员
getListMembers = (l_id) ->
  logger.info l_id
  t.get 'lists/members', {list_id: l_id}, (error, reply) ->
    if error
      logger.error error
    else
      members = []
      members.push user.id_str for user in reply.users
      onTweets members

# 获取最新Tweet
onTweets = (members) ->
  logger.info members
  stream = t.stream('statuses/filter', {follow: members})
  stream.on 'tweet', (tweet) ->
    logger.info tweet

getLists()


