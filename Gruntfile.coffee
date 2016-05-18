module.exports = (grunt) ->	
	@initConfig
		
		##############################################

		compass:
			options:
				# require: ['breakpoint-slicer']
				cssDir: "public/css"
				sassDir: "public/sass"
				imagesDir: "public/img"
				fontsDir: "public/css/fonts"
				javascriptsDir: "public/js"
				relativeAssets: true
				force: true
				raw: """
				preferred_syntax = :sass
				::Sass::Script::Number.precision = [10, ::Sass::Script::Number.precision].max
				sass_options = {:quiet => true}

				"""
			dev:
				options:
					outputStyle: 'expanded'
			prod:
				options:
					outputStyle: 'compressed'

		##############################################

		watch:
			dev:
				options:
					spawn: true
					livereload: true
				files: ["public/**/**"]
				tasks: ['default']


	#######################################
	# Default task
	#######################################
	
	@registerTask 'default', [
		'compass:dev'
	]

	#######################################
	@loadNpmTasks 'grunt-contrib-watch'
	@loadNpmTasks 'grunt-contrib-compass'