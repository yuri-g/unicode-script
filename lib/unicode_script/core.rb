module UnicodeScript
  def self.detect(string)
    res = []
    string.tr!(' ', '')
    string.codepoints.each do |c|
      script = find_script(c)
      index = res.find_index { |v| v[:script] == script }
      if script
        if index
          res[index][:value].push(c.chr)
        else
          res.push(script: script, value: [].push(c.chr))
        end
      end
    end
    res.each do |r|
      r[:value] = r[:value].join('')
    end
    res
  end

  def self.method_missing(method, val)
    script_name = method.to_s.gsub('_', ' ').chop
    if charted? script_name
      val.codepoints.each do |point|
        return false unless CHARTS[script_name].include?(point)
      end
      return true
    else
      super
    end
  end

  def self.respond_to_missing?(method, include_private = false)
    charted?(method.to_s.gsub('_', ' ').chop) || super
  end

  private

  def self.charted?(script)
    CHARTS.key?(script)
  end

  def self.find_script(codepoint)
    CHARTS.each do |k, v|
      return k if v.include? codepoint
    end
    nil
  end
end
