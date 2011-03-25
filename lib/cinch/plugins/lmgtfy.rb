#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# Copyright (c) 2011 Victor Bergöö
# This program is made available under the terms of the MIT License.

require 'cinch'
require 'curb'
require 'uri'
require 'json'

module Cinch
  module Plugins
    class LMGTFY
      include Cinch::Plugin
      
      LmgtfyUrl = "http://lmgtfy.com/?q=%s"
      ShortnerUrl = "http://api.bitly.com/v3/shorten?login=%s&apiKey=%s&format=json&longUrl=%s"
      
      match /google ([^\s]*) (.*)/
      
      def execute m, user, query
        if not config["username"] or not config["api_key"]
          @bot.debug "either 'username' or 'api_key' is not set, please add these options"
          return
        end
        
        search = LmgtfyUrl % [query.dup.gsub(/\s+/, "+")]
        short = ShortnerUrl % [config["username"], config["api_key"], URI.escape(search)]
        
        call = Curl::Easy.perform(short)
        json = JSON.parse call.body_str
        
        if json["status_code"] == 200
          url = json["data"]["url"]
          m.reply "#{user} check this out: #{url}"
        else 
          error = json["status_text"]
          m.reply "Something went wrong: #{error}"
        end
      end
    end
  end
end