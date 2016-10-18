class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.split.join.length

    @word_count = @text.split.count

    @occurrences = @text.split.each do |text|
      @text.split.each == @special_word
    end

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

# P = (r * A) / (1 - (1+r) ^ (-N))

    @monthly_payment = ((@apr / 1200) * @principal) / (1 - (1 + (@apr / 1200)) ** (@years * -12))

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = @ending - @starting
    @minutes = (@ending - @starting) / 60
    @hours = (@ending - @starting) / (60 * 60)
    @days = (@ending - @starting) / (60 * 60 * 24)
    @weeks = (@ending - @starting) / (60 * 60 * 24 * 7)
    @years = (@ending - @starting) / (60 * 60 * 24 * 7 * 52)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @numbers.max - @numbers.min

    @median = "Replace this string with your answer."

    @sum = @numbers.sum

    @mean = @numbers.sum / @numbers.count

    # VARIANCE
    # ========
    # To find the variance of a set,
    #  - we find the mean of the set
    #  - for each number in the set,
    #   - we find the difference between the number and the mean
    #   - we square the difference
    #  - the variance is the mean of the squared differences

    @variance = "Replace this string with your answer."

    # STANDARD DEVIATION
    # ==================
    # To find the standard deviation of a set,
    #  - take the square root of the variance

    @standard_deviation = "Replace this string with your answer."

    @mode = "Replace this string with your answer."

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
