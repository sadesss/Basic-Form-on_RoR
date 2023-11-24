# frozen_string_literal: true

# class
class ArmsController < ApplicationController
  def output
    input_str = params[:val]
    input_str = '1 2 -3.2 2.5 8 0' if input_str.blank?
    input_str = input_str.strip

    unless valid_input?(input_str)
      flash[:alert] = 'Введите только числа, разделенные пробелами.'
      redirect_to root_path
      return
    end

    @out_arr = input(input_str).select { |num| num.is_a?(Numeric) && num.positive? }
    @sum = @out_arr.sum
  end

  private

  def valid_input?(input_str)
    input_str.match?(/\A-?\d+(\.\d+)?(\s+-?\d+(\.\d+)?)*\z/)
  end

  def input(input_str)
    input_str.split.map { |num| convert_to_numeric(num) }
  end

  def convert_to_numeric(num)
    num.include?('.') ? Float(num) : Integer(num)
  rescue StandardError => e
    Rails.logger.error("Error converting #{num} to number: #{e.message}")
    num
  end
end
