# encoding: UTF-8

require 'simplecov-rcov'

SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter

SimpleCov.start do
  add_filter '.*.gemspec'
  add_filter '.rspec'
  add_filter '.rvmrc'
  add_filter '.simplecov'
  add_filter '/.bin/'
  add_filter '/.bundle/'
  add_filter '/.idea/'
  add_filter '/script/'
  add_filter '/spec/'
  add_filter '/vendor/'
  add_filter 'Gemfile.*'
end
