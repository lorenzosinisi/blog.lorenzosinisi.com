#env :PATH, ENV['PATH']
#every 1.minute do
#    runner "Job.one_minute!"
#    puts "Remove one minute"
#end
#every 1.minute do
#  runner "Ticketman.process_jobs"
#  puts "Processing jobs"
#end
#
#every 1.minute + 30.seconds do
#  runner "Ticketman.process_jobs"
#  puts "Processing jobs"
#end
