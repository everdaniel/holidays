module Holidays
  module Easter
    # Get the date of Easter in a given year.
    #
    # +year+ must be a valid Gregorian year.
    #
    # Returns a Date object.
    #--
    # from http://snippets.dzone.com/posts/show/765
    # TODO: check year to ensure Gregorian
    def easter(year)
      y = year
      a = y % 19
      b = y / 100
      c = y % 100
      d = b / 4
      e = b % 4
      f = (b + 8) / 25
      g = (b - f + 1) / 3
      h = (19 * a + b - d - g + 15) % 30
      i = c / 4
      k = c % 4
      l = (32 + 2 * e + 2 * i - h - k) % 7
      m = (a + 11 * h + 22 * l) / 451
      month = (h + l - 7 * m + 114) / 31
      day = ((h + l - 7 * m + 114) % 31) + 1
      Date.civil(year, month, day)
    end
  end
end
