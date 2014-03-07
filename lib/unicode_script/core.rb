module UnicodeScript

    def self.detect string
      res = []
      string.tr!(' ','')
      string.codepoints.each do |c|
        script = find_script(c)
        index = res.find_index{|v| v[:script] == script}
        if script
          if index
            res[index][:value].push(c.chr)
          else
            res.push({:script => script, :value => [].push(c.chr)})
          end
        end

      end  
      res.each do |r| 
        r[:value] = r[:value].join('')
      end
      res
    end
  
  
    def self.method_missing method, val
      CHARTS.each do |c|
        if c[:name].downcase == method.to_s.chop
          val.codepoints.each do |p|
            return false if !(c[:range].include?(p)) 
          end
          return true
        end
      end
      super
    end
  
    private
  
    def self.find_script codepoint
      CHARTS.each do |c|
        return c[:name] if c[:range].include? codepoint
      end
      nil
    end

end