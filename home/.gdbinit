# don't bother me on quit
set confirm off

# history
set history filename ~/.gdb/history
set history size 10000
set history save on

# log a lot
set logging file ~/.gdb/log
set logging overwrite on
set logging on
set verbose on

# user scripting
source /home/myuser/.gdb/py-modules/add-syspath.py
add-auto-load-safe-path /home/myuser/.gdb
add-auto-load-scripts-directory /home/myuser/.gdb/auto-load

# syslog tracing
define ktrace
	break $arg0
	commands
		silent
		set $pid=getpid()
		eval "set $ktraceout=\"/tmp/ktrace.%d.out\"", $pid
		printf "ktrace started: %s\n", $ktraceout
		eval "shell ktrace -a -f %s -p %d", $ktraceout, $pid
		printf "\nrun \"ktrace_stop\" to stop tracing\n\n"
		finish
	end
end

define ktrace_stop
	set $pid=getpid()
	eval "set $ktraceout=\"/tmp/ktrace.%d.out\"", $pid
	eval "shell ktrace -c -f %s", $ktraceout
	printf "ktrace stopped for %s\n", $ktraceout
end
