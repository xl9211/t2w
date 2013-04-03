Twit = require 'twit'
log4js = require 'log4js'
_ = require 'underscore'

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

MY_IDS = [17145920]
MY_LISTS = {}

# 获取列表
getLists = ->
  t.get 'lists/list', (error, reply) ->
    if error
      logger.error error
    else
      for list in reply
        getListMembers list

# 获取列表成员
getListMembers = (list) ->
  t.get 'lists/members', {list_id: list.id_str}, (error, reply) ->
    if error
      logger.error error
    else
      members = []
      members.push user.id_str for user in reply.users
      MY_LISTS[list.name] = members

# 获取最新Tweet
onTweets = (follows) ->
  stream = t.stream('statuses/filter', {follow: follows})
  stream.on 'tweet', (tweet) ->
    logger.info tweet
    logger.info MY_LISTS

getLists()
onTweets(MY_IDS)





