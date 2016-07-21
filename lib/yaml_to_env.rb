require 'yaml'

class YamlToEnv

  def yaml_to_env(yaml_content)
    hash = YAML.load yaml_content

    iterate_on_yaml hash, nil
  end

  private

  def iterate_on_yaml(hash, prefix)
    output = ''
    hash.each do |k,v|

      if v.is_a? Array
        raise 'Hash in Array not defined' if v.find { |element| element.is_a? Hash }

        v_string = v.join(',')
        output += "export #{prefix}#{k}=#{v_string}\n"
      elsif v.is_a? Hash
        output += iterate_on_yaml v, "#{prefix}#{k}_"
      else
        v_string = v.to_s
        output += "export #{prefix}#{k}=#{v_string}\n"
      end
    end
    output
  end
end