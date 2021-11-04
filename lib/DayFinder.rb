# frozen_string_literal: true

require_relative "DayFinder/version"

module DayFinder
  class Error < StandardError; end

  # Your code goes here...
  M31 = [1, 3, 5, 7, 8, 10, 12]
  M30 = [11, 4, 6, 9]
  WEEKDAY = %w[Saturday Sunday Monday Tuesday Wednesday Thursday Friday]
  $week = 0

  def self.find d, m, year
    month_28 = [2]
    leap = false
    leap = true if ((year % 4).zero? && (year % 100 != 0)) || (year % 400).zero?
    raise "day is invalid" if (m == 2) && (d >= 30)
    raise "month 2 date invalid" if !leap && m == 2 && d >= 29
    raise "Invalid date" if (M31.include?(m) && d >= 32 && d != 0) || (M30.include?(m) && d >= 31 && d != 0)
    raise "Day is invalid" if d <= 0
    raise "Month invalid " if !M31.include?(m) && !M30.include?(m) && !month_28.include?(m)

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
    $week = w
    # puts leap
    WEEKDAY[w]
    # w
  end

  def self.findAll m, year, day
    leap = true if ((year % 4).zero? && (year % 100 != 0)) || (year % 400).zero?
    if leap and m == 2
      days = 29
    elsif M31.include?(m)
      days = 31
    elsif M30.include?(m)
      days = 30
    else
      days = 28
    end
    find 1, m, year
    dayslist = []
    if WEEKDAY[$week] == day.capitalize
      i = 1
      while (i <= days)
        dayslist << i
        i += 7
      end
    else
      for i in (1..days)
        find i, m, year
        if WEEKDAY[$week] == day.capitalize
          break
        end
      end
      while (i <= days)
        dayslist << i
        i += 7
      end
    end
     dayslist
  end
end
puts DayFinder.find 29,2,2020
puts DayFinder.findAll 2, 2020, "saturday"