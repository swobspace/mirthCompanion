# frozen_string_literal: true

class ConditionBadgeComponent < ViewComponent::Base
  def initialize(state:, count:, small: false, link: nil, myframe: nil)
    @state = state
    @count = count
    @link = link
    @myframe = myframe
    @button_class = ""
    @icon  = ""
    # @small = small
    set_variant
  end

  def set_variant
    if @small
      size = "btn btn-sm"
    else
      size = "btn"
    end

    if count == 0
      btn = "btn-outline"
      textcolor = ""
    else
      btn = "btn"
      textcolor = "text-white"
    end

    case state
     when Mirco::States::CRITICAL
        @button_class = "#{size} #{btn}-danger"
        @icon  = "fa-solid fa-circle-exclamation"
      when Mirco::States::UNKNOWN
        @button_class = "#{size} #{btn}-info"
        @icon  = "fa-solid fa-circle-question #{textcolor}"
      when Mirco::States::WARNING
        @button_class = "#{size} #{btn}-warning"
        @icon  = "fa-solid fa-triangle-exclamation #{textcolor}"
      when Mirco::States::OK
        @button_class = "#{size} #{btn}-success"
        @icon  = "fa-solid fa-circle-check"
      else
        @button_class = "#{size} #{btn}-secondary"
        @icon  = "fa-solid fa-circle-xmark"
    end
  end

private
  attr_reader :state, :button_class, :icon, :count, :link, :myframe
end
