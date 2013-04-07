exec = require('child_process').exec
spawn = require('child_process').spawn

task 'compile', '编译Coffee为JavaScript', ->
  spawn 'jitter', ['.', '.']
  console.log "编译监控已开始..."

task 'test', '进行单元测试', ->
  exec 'jasmine-node --coffee tests/', (error, stdout, stderr) ->
    console.log stdout
    console.log "单元测试已完成..."

task 'mongo', '启动MongoDB', ->
  exec 'mongod --config ~/.mongodb/mongodb.conf', (error, stdout, stderr) ->
    if stdout.indexOf("ERROR") isnt -1
      console.log stdout
      console.log "MongoDB启动失败..."
    else
      console.log "MongoDB已启动..."

task 'stopm', '停止MongoDB', ->
  exec 'killall -9 mongod', (error, stdout, stderr) ->
    console.log "MongoDB已停止..."

task 'dev', '启动开发环境，先启动DB，在进行Compile监控', (error, stdout, stderr) ->
  exec 'mongod --config ~/.mongodb/mongodb.conf', (error, stdout, stderr) ->
    if stdout.indexOf("ERROR") isnt -1
      console.log stdout
      console.log "MongoDB启动失败..."
    else
      console.log "MongoDB已启动..."
      invoke 'compile'
      console.log "开发环境已启动..."

task 'devt', '测试开发运行', (error, stdout, stderr) ->
  exec 'git pull', (error, stdout, stderr) ->
    console.log stdout
    exec 'coffee -c .', (error, stdout, stderr) ->
      console.log stdout
      exec 'NODE_ENV=development node app.js', (error, stdout, stderr) ->
        console.log stdout




