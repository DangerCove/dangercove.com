#!/bin/sh

bundle exec rake install["dangercove"] && bundle exec rake generate && bundle exec rake preview
