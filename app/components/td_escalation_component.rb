# frozen_string_literal: true

class TdEscalationComponent < ViewComponent::Base
  def initialize(escalatable:, attrib:, alert: false, css: '', manual_update: false)
    @escalatable = escalatable
    @attrib = attrib
    @alert = alert
    @css = css
    @manual_update = manual_update
    @value = escalatable.send(attrib)
    if escalatable.send(attrib).kind_of? Time
      @value = escalatable.send(attrib)&.to_fs(:local)
    end
    @escalation_status = escalatable.escalation_status(attrib)
    @background_color = background_color
  end

  private

  attr_reader :escalatable, :attrib, :value, :alert, :css, :manual_update, :escalation_status

  def background_color
    if manual_update
      'bg-light'
    else
      result = escalation_status.state
      case result
      when EscalationLevel::UNKNOWN
        'bg-UNKNOWN'
      when EscalationLevel::OK
        'bg-OK'
      when EscalationLevel::WARNING
        alert ? 'bg-ALERT' : 'bg-WARN'
      when EscalationLevel::CRITICAL
        alert ? 'bg-ALERT' : 'bg-CRITICAL'
      else
        ''
      end
    end
  end

end
