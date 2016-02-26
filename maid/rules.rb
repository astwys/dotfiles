Maid.rules do
	rule 'compressed' do
		move(dir('~/Downloads/*.{dmg,zip,pkg,tar,iso,7z,b1}'), mkdir('~/Downloads/Compressed'))
	end

	rule 'images' do
		move(dir('~/Downloads/*.{jpg,jpeg,png,PNG,JPG}'), mkdir('~/Downloads/Images'))
	end

	rule 'apps' do
		move(dir('~/Downloads/*.app'), '/Applications/')
	end

	rule 'documents' do
		move(dir('~/Downloads/*.{doc,docx,pages}'), mkdir('~/Downloads/Documents'))
	end

	rule 'pdfs' do
		move(dir('~/Downloads/*.pdf'), mkdir('~/Downloads/PDFs'))
	end

	rule 'windows stuff' do
		move(dir('~/Downloads/*.{exe,pkt}'), mkdir('~/Downloads/Windows_Stuff'))
	end

	#TODO check for screenshots
	# rule 'screenshots' do
	# 	move(dir('~/Desktop/Screen Shot*'), mkdir('~/Desktop/Screenshots'))
	# end

	# rule 'delete old screenshots' do
	# 	dir('~/Desktop/Screenshots').each do |path|
	# 		if 1.week.since?(accessed_at(path))
	# 			trash(path)
	# 		end
	# 	end
	# end

	rule 'mp3/4 files' do
		dir('~/Downloads/{*,*/*}.{mp3,mp4}').each do |path|
			if 1.week.since?(created_at(path))
				trash(path)
			end
		end
	end

	#trash empty directories from the ~/Downloads folder
	# rule 'Remove empty directories' do
	# 	dir(['~/Downloads/*']).each do |path|
	# 		if File.directory?(path) && dir("#{ path }/*").empty?
	# 			trash(path)
	# 		end
	# 	end
	# end

	#
	# Update all our Applications, brew, oh my fish and such
	#
	# rule 'Updating Brew' do
	# 	`brew update`
	# end
	# rule 'Updating Brews' do
	# 	`brew upgrade -all`
	# end
	# rule 'Cleaning Brew' do
	# 	`brew cleanup`
	# end
	# rule 'Cleaning Brew Cask' do
	# 	`brew cask cleanup`
	# end
	# rule 'Updating Cask Applications' do
	# 	`brew cask update`
	# end
	# rule 'Updating gems ' do
	# 	`sudo gem update`
	# end
	# rule 'Update npm' do
	# 	`sudo npm -g update`
	# end
	# rule 'Update omf' do
	# 	'omf update'
	# end
end
