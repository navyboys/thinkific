class ApplicationController < ActionController::Base
  before_action :set_thinkific_integer

  def set_thinkific_integer
    if ThinkificInteger.count.zero?
      @thinkific_integer = ThinkificInteger.new
      save_value(0)
    else
      @thinkific_integer = ThinkificInteger.all.first
    end
  end
end
