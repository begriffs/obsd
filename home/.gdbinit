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

# can scroll back in my terminal, and pagination
# is annoyting when setting mass breakpoints
set pagination off

# user scripting
source /home/myuser/.gdb/py-modules/add-syspath.py
add-auto-load-safe-path /home/myuser/.gdb
add-auto-load-scripts-directory /home/myuser/.gdb/auto-load

source /home/j/.gdb/py-modules/frame.py

# trace function calls

define ftrace
	dont-repeat

	set $first_new = 1 + ($bpnum ? $bpnum : 0)

	if $argc < 1
		# by default, trace all functions except those that start with
		# underscore, since they are weird system things
		rbreak ^[a-zA-Z]
	else
		rbreak $arg0
	end
	commands
		silent
		python print(frame_indented_name(gdb.newest_frame()))
		cont
	end

	printf "\nTracing enabled. To disable, run:\n\tdel %d-%d\n", $first_new, $bpnum
end

define pstack
	dont-repeat

	python print(frame_path(gdb.newest_frame()))
end

# trace system calls

define ktrace
	dont-repeat
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

define hook-stop
	if $display_locals_flag
		info locals
	end
end

define display_locals
	set $display_locals_flag = 1
end

define undisplay_locals
	set $display_locals_flag = 0
end
