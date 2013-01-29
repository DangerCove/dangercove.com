#!/bin/sh

rm -rf sass
rm -rf public
rm -rf source/assets
rm -rf source/javascripts
rm -rf source/stylesheets
bundle exec rake install["dangercove"] && bundle exec rake generate && bundle exec rake preview
