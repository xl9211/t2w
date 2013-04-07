exec = require('child_process').exec

task 'compile', '编译Coffee为JavaScript', ->
  exec 'git pull', (error, stdout, stderr) ->
    console.log stdout
    console.log "代码已更新..."
    exec 'coffee -c .', (error, stdout, stderr) ->
      console.log stdout
      console.log "编译已完成..."

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

task 'dev', '启动开发环境，先启动DB，在进行Compile监控', ->
  exec 'mongod --config ~/.mongodb/mongodb.conf', (error, stdout, stderr) ->
    if stdout.indexOf("ERROR") isnt -1
      console.log stdout
      console.log "MongoDB启动失败..."
    else
      console.log "MongoDB已启动..."
      invoke 'compile'
      console.log "开发环境已启动..."






