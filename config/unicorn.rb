APP_PATH = "/home/kiwit/www/app/kiwit/current/"
SHARED_PATH = "/home/kiwit/www/app/kiwit/shared/"
worker_processes 1
user "kiwit", "web"
working_directory APP_PATH
listen SHARED_PATH + "/sockets/kiwit.sock", :backlog => 64
timeout 30
pid SHARED_PATH + "/pids/unicorn.pid"

stderr_path APP_PATH + "/log/unicorn.stderr.log"
stdout_path APP_PATH + "/log/unicorn.stdout.log"

preload_app true
if GC.respond_to?(:copy_on_write_friendly=)
  GC.copy_on_write_friendly = true
end
