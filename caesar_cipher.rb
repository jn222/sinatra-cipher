require 'sinatra'
require 'sinatra/reloader' if development?

	def caesar_cipher(s, offset)
		output = ""
		s.each_char do |char|
			if ('A'..'Z') === char
				char = shift(char, offset, 'A')
			elsif ('a'..'z') === char
				char = shift(char, offset, 'a')
			end
			output << char
		end
		output
	end

	def shift(char, offset, base)
		((char.ord + offset - base.ord)%26 + base.ord).chr
	end

get '/' do
	s = params['s']
	offset = params['offset'].to_i
	response = caesar_cipher(s, offset) unless s.nil? || offset.nil?
	erb :index, :locals => {:response => response}
end