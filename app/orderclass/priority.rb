class Priority
    def self.options_for_priority
      priority_list = []
      self.options_for_enum.each do | key, value |
        priority_list.push([("#{key}"), key])
      end
      return priority_list
    end
    private
    def self.options_for_enum
      { low: 0,
        normal: 1,
        high: 2,
      }
    end
  end