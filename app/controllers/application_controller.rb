class ApplicationController < ActionController::Base
  before_action :set_integer

  def set_integer
    if ThinkificInteger.count.zero?
      @thinkific_integer = ThinkificInteger.new
      save_integer(0)
    else
      @thinkific_integer = ThinkificInteger.all.first
    end
  end

  def save_integer(value)
    @thinkific_integer.content = value
    @thinkific_integer.save
  end

  def current_integer
    @thinkific_integer.content
  end
end
