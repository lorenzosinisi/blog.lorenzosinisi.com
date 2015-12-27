Delayed::Worker.destroy_failed_jobs = false
Delayed::Worker.sleep_delay = 1
Delayed::Worker.max_attempts = 2
Delayed::Worker.max_run_time = 30.seconds
Delayed::Worker.read_ahead = 10
Delayed::Worker.default_queue_name = 'default'
