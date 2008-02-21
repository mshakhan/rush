class Rush::Process
	attr_reader :box, :pid, :uid, :command, :cmdline, :mem, :cpu

	def initialize(params, box)
		@box = box

		@pid = params[:pid].to_i
		@uid = params[:uid].to_i
		@command = params[:command]
		@cmdline = params[:cmdline]
		@mem = params[:mem]
		@cpu = params[:cpu]
	end

	def to_s
		inspect
	end

	def inspect
		"#{box} process #{@pid}: #{@cmdline}"
	end

	def alive?
		box.connection.process_alive(pid)
	end

	def kill
		box.connection.kill_process(pid)
	end

	def self.all
		Rush::Box.new('localhost').processes
	end
end  
