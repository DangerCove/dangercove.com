# This is the Danger Cove Active Menu plugin
#
# Installation:
# Place this file in your plugin directory.
#
# Usage:
# class="{% dcactivemenu page.url checkfor.html [/another] %}"
#
# Returns 'active' when the checkfor.html occurs in the page.url
#
# Author: boy@dangercove.com
# Twitter: @dangercove
#


module Jekyll

  class DCActiveMenu < Liquid::Tag
    @check_for = nil

    def initialize(tag_name, params, tokens)
      @check_for = params.split(" ")
      super
    end

    def render(context)
      page_url = context.environments.first["page"]["url"]
      if @check_for.count < 1
        return "Error processing input, expected syntax: {% dcactivemenu checkfor.html [/other.html]  %}"
      end
      output = ""
      for url in @check_for
        if page_url.match(/^#{url.strip}/)
           output = "active"
        end
      end
      output
    end
  end
end

Liquid::Template.register_tag('dcactivemenu', Jekyll::DCActiveMenu)
