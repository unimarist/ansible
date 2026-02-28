#アプリケーションサーバの性能
$worker  = 2
#Railsアプリケーションの応答を待つ上限時間
$timeout = 30
#アプリケーションコードが設置されているディレクトリ
$app_dir = "/var/www/rails/memory_tank" 
#待ち受けパス
$listen  = File.expand_path 'tmp/sockets/.unicorn.sock', $app_dir
#Unicornの起動に必要なファイルのパス
$pid     = File.expand_path 'tmp/pids/unicorn.pid', $app_dir
#ログのパス
$std_log = File.expand_path 'log/unicorn.log', $app_dir

#ワーカープロセス数の設定
worker_processes  $worker
#アプリケーションコードが設置されているディレクトリを設定
working_directory $app_dir
#エラーログの設定
stderr_path $std_log
#通常ログの設定
stdout_path $std_log
#タイムアウト値の設定
timeout $timeout
#待ち受けの設定
listen  $listen
#Unicornの起動に必要なファイルの設定
pid $pid

preload_app true
# プロセス起動前処理
before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      Process.kill "QUIT", File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end
# プロセス起動後処理
after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end