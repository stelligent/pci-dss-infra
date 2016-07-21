require 'awspec'

fail 'rArchiveLogsBucket must be set' if rArchiveLogsBucket.nil?

describe s3_bucket(rArchiveLogsBucket) do
  it { should have_versioning_enabled }
end