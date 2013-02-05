# This is the Danger Cove Screenshots plugin
#
# Installation:
# Place this file in your plugin directory.
#
# Usage:
# {% dcscreenshots output %}
# adventure|screenshot_filename|image_format|screenshot_name
# adventure|screenshot_filename|image_format|screenshot_name
# adventure|screenshot_filename|image_format|screenshot_name
# {% enddcscreenshots %}
# {{ output }}
#
# Author: boy@dangercove.com
# Twitter: @dangercove
#

module Jekyll
  class DCScreenshots < Liquid::Capture
    def render(context)
      # extract entire block and split on newlines
      screenshots = render_all(@nodelist, context).split(/\n/)
      screenshots.shift # Remove first empty item

      output = %{
<div class="screenshots_container">
  <ul class="screenshots">
      }
      screenshots.each do |screenshot|
        params = screenshot.split(/\|/)
        output << "<li id=\"#{params[1]}_screenshot\"><img src=\"/images/adventures/#{params[0]}/screenshots/#{params[1]}.#{params[2]}\" alt=\"#{params[3]}\"></li>"
      end
      output << %{
  </ul>
  <div class="pagination pagination-large pagination-centered">
    <ul>
      }
      screenshots.each do |screenshot|
        params = screenshot.split(/\|/)
        output << "<li><a href=\"##{params[1]}\">#{params[3]}</a></li>"
      end
      output << %{
    </ul>
  </div>
</div>
      }
      context.scopes.last[@to] = output

      '' # Suppress output
    end
  end
end
Liquid::Template.register_tag('dcscreenshots', Jekyll::DCScreenshots)
