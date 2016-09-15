-- Andrew Thomas 2016
-- iMessage handler script

using terms from application "Messages"
	
	-- User Defined Functions
	
	-- Generate a random fortune
	on runFortune()
		
		set theResult to do shell script "bash -l -c '$(which fortune)'"
		
		return theResult as text
	end runFortune
	
	-- Get the weather
	on runWeather(theLocation)
		
		set theWeatherPath to do shell script "bash -l -c 'which ansiweather'"
		
		set theCommand to "echo '-a' 'off' '-u' 'imperial' '-l' " & the quoted form of theLocation & " | xargs " & theWeatherPath
		
		
		
		set theResult to do shell script "bash -l -c '" & theCommand & "'"
		
		if theResult starts with " Current" then
			return theResult as text
		else
			return ">!weather does not know that city"
		end if
		
	end runWeather
	
	on logToFile(theString, theFile)
		do shell script "echo `date '+%Y-%m-%d %T: '`\"" & theString & "\" >> $HOME/Library/Logs/" & theFile & ".log"
	end logToFile
	
	-- End User Defined functions
	
	-- Message received handler
	on message received theMessage from theBuddy for theChat
		try
			
			set theResponse to ""
			
			if theMessage starts with "!fortune" then
				
				set theResponse to runFortune()
				
			else if theMessage starts with "!weather" then
				
				set theResponse to runWeather(text ((length of "!weather ") + 1) through (length of theMessage) of theMessage)
				
			end if
			
			if theResponse ­ "" then
				send theResponse to theBuddy
			end if
		on error e number n
			logToFile(e & " " & n, "MessageHandler")
		end try
	end message received
	
	-- Unused handlers
	-- These are needed or else the script will crash
	
	on message sent theMessage with eventDescription
		# say eventDescription
	end message sent
	
	on chat room message received with eventDescription
		# say eventDescription
	end chat room message received
	
	on active chat message received with eventDescription
		# say eventDescription
	end active chat message received
	
	on addressed message received theMessage from theBuddy for theChat with eventDescription
		# say eventDescription
	end addressed message received
	
	on received text invitation with eventDescription
		# say eventDescription
	end received text invitation
	
	on received audio invitation theText from theBuddy for theChat with eventDescription
		# say eventDescription
	end received audio invitation
	
	on received video invitation theText from theBuddy for theChat with eventDescription
		# say eventDescription
	end received video invitation
	
	#on received screen sharing invitation from theBuddy for theChat with eventDescription
	# say eventDescription
	#end received local screen sharing invitation
	
	on buddy authorization requested with eventDescription
		# say eventDescription
	end buddy authorization requested
	
	on addressed chat room message received with eventDescription
		# say eventDescription
	end addressed chat room message received
	
	#on received remote screen sharing invitation with eventDescription
	# say eventDescription
	#end received remote screen sharing invitation
	
	# The following are unused but need to be defined to avoid an error
	
	on login finished with eventDescription
		# say eventDescription
	end login finished
	
	on logout finished with eventDescription
		# say eventDescription
	end logout finished
	
	on buddy became available with eventDescription
		# say eventDescription
	end buddy became available
	
	on buddy became unavailable with eventDescription
		# say eventDescription
	end buddy became unavailable
	
	on received file transfer invitation theFileTransfer with eventDescription
		# say eventDescription
	end received file transfer invitation
	
	on av chat started with eventDescription
		# say eventDescription
	end av chat started
	
	on av chat ended with eventDescription
		# say eventDescription
	end av chat ended
	
	on completed file transfer with eventDescription
		# say eventDescription
	end completed file transfer
	
end using terms from
