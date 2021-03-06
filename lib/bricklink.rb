require 'dotenv/load'
require 'byebug' if ENV['ENV'] == 'development'
require 'bricklink/version'
require 'bricklink/client'

module BrickLink
  class Error < StandardError; end
end