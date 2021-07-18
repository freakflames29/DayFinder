# frozen_string_literal: true

require_relative "DayFinder/version"

module DayFinder
  class Error < StandardError; end

  # Your code goes here...
  def self.find d,m,year
    leap = false
    leap = true if ((year % 4).zero? && (year % 100 != 0)) || (year % 400).zero?
    raise "day is invalid" if (m == 2) && (d >= 30)
    raise "month 2 date invalid" if !leap && m == 2 && d >= 29

    if m > 2
      mo = m
    else
      mo = 12 + m
      year -= 1
    end
    y = year % 100
    c = year / 100
    x = d + (13 * (mo + 1)) / 5 + y + (y / 4) + (c / 4) + 5 * c
    w = x % 7
    weekday = %w[Saturday Sunday Monday Tuesday Wednesday Thursday Friday]
    # puts leap
    weekday[w]
  end
end
