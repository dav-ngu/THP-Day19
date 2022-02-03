require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/application'


#lancement du jeu
Application.new.perform

binding.pry