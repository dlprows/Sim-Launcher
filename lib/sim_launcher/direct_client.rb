module SimLauncher
	class DirectClient
		def initialize( app_path, sdk, options ={} )
			@app_path = File.expand_path( app_path )
			@sdk = sdk
			@family = options[:family]
			@device_type_identifier = options[:device_type_identifier]
		end

		def self.for_ipad_app( app_path, sdk = nil )
			self.new( app_path, sdk, 'ipad' )
		end

		def self.for_iphone_app( app_path, sdk = nil )
			self.new( app_path, sdk, 'iphone' )
		end

		def launch
			if @device_type_identifier.to_s != ''
				SimLauncher::Simulator.new.launch_ios_app_with_device_identifier(@app_path, @sdk, @device_type_identifier)
			else
				SimLauncher::Simulator.new.launch_ios_app( @app_path, @sdk, @family, @device_type_identifier)
			end

		end

		def rotate_left
			simulator = SimLauncher::Simulator.new
			simulator.rotate_left
		end

		def rotate_right
			simulator = SimLauncher::Simulator.new
			simulator.rotate_right
		end



		def relaunch
			simulator = SimLauncher::Simulator.new
			simulator.quit_simulator
			launch
		end
	end
end
