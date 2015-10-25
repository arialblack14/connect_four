RSpec.configure do |config|
	# Use color in STDOUT
	config.color = true

	# Use color in pagers and files too
	config.tty = true

	# Use the specified formatter
	config.formatter = :documentation
end