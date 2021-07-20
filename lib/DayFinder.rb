# frozen_string_literal: true

require_relative "DayFinder/version"

module DayFinder
  class Error < StandardError; end

  # Your code goes here...
  def self.find d,m,year
    month_31 = [1,3,5,7,8,10,12]
    month_30 = [11,4,6,9]
    month_28=[2]
    leap = false
    leap = true if ((year % 4).zero? && (year % 100 != 0)) || (year % 400).zero?
    raise "day is invalid" if (m == 2) && (d >= 30)
    raise "month 2 date invalid" if !leap && m == 2 && d >= 29
    raise "Invalid date" if (month_31.include?(m) && d >= 32 && d != 0) || (month_30.include?(m) && d >= 31 && d != 0)
    raise "Day is invalid" if d <= 0
    raise "Month invalid " if !month_31.include?(m) && !month_30.include?(m) && !month_28.include?(m)

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