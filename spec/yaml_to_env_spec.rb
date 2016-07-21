require 'yaml_to_env'

describe YamlToEnv do


  context 'flat yaml' do

    it 'should return collection of env var settings' do
      flat_yaml = <<END
---
key1: foo
key2: moo
key3: zoo
END

      output = YamlToEnv.new.yaml_to_env flat_yaml
      expect(output).to eq <<END
export key1=foo
export key2=moo
export key3=zoo
END
    end
  end

  context 'simple array yaml' do

    it 'should return collection of env var settings' do
      flat_yaml = <<END
---
key1:
  - foo
  - moo2
  - moo3
key2: moo
key3: zoo
END

      output = YamlToEnv.new.yaml_to_env flat_yaml
      expect(output).to eq <<END
export key1=foo,moo2,moo3
export key2=moo
export key3=zoo
END
    end
  end

  context 'hash yaml' do

    it 'should return collection of env var settings' do
      flat_yaml = <<END
---
key1:
  keyA: foo
  keyA2: moo2
  keyA3: moo3
key2: moo
key3: zoo
END

      output = YamlToEnv.new.yaml_to_env flat_yaml
      expect(output).to eq <<END
export key1_keyA=foo
export key1_keyA2=moo2
export key1_keyA3=moo3
export key2=moo
export key3=zoo
END
    end

    it 'should return collection of env var settings' do
      flat_yaml = <<END
---
key1:
  keyA:
    moo: cow
    alpaca: fur
  keyA2: moo2
  keyA3: moo3
key2: moo
key3: zoo
END

      output = YamlToEnv.new.yaml_to_env flat_yaml
      expect(output).to eq <<END
export key1_keyA_moo=cow
export key1_keyA_alpaca=fur
export key1_keyA2=moo2
export key1_keyA3=moo3
export key2=moo
export key3=zoo
END
    end
  end

  context 'hash with array element yaml' do

    it 'should return collection of env var settings' do
      flat_yaml = <<END
---
key1:
  keyA:
    - zoo2
    - zoo3
  keyA2: moo2
  keyA3: moo3
key2: moo
key3: zoo
END

      output = YamlToEnv.new.yaml_to_env flat_yaml
      expect(output).to eq <<END
export key1_keyA=zoo2,zoo3
export key1_keyA2=moo2
export key1_keyA3=moo3
export key2=moo
export key3=zoo
END
    end
  end

  context 'array of hash yaml' do

    it 'should raise an error' do
      flat_yaml = <<END
---
key1:
  - foo
  - moo2
  - moo3: moo
    fred: wilma
key2: moo
key3: zoo
END

      expect {
        YamlToEnv.new.yaml_to_env flat_yaml
      }.to raise_error 'Hash in Array not defined'
    end
  end
end