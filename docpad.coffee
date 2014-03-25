# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {
	collections:
	    topics: ->
	        @getCollection("documents").findAll({relativeOutDirPath: 'topics'})
}

# Export the DocPad Configuration
module.exports = docpadConfig