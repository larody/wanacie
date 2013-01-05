#!/usr/bin/ruby

puts `git status -s`
puts `git commit -am '#{Time.now}'`
puts `git push origin master`
