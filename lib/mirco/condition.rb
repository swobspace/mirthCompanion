module Mirco
  module Condition

    def set_condition(state, message)
      self[:condition] = state
      self[:condition_message] =  [ shortcut(state),
                                    # I18n.t(state, scope: 'mirco.condition'),
                                    message
                                  ].compact.join(' ')
      if state == Mirco::States::OK
        if respond_to?(:last_ok)
          self[:last_ok] = Time.current
        end
        if respond_to?(:close_acknowledge)
          close_acknowledge
        end
      end
    end

  private

    def shortcut(condition)
      shortcut = Mirco::States::flag(condition)
    end

  end
end
