require 'awspec'

fail 'rArchiveLogsBucket must be set' if ENV['rArchiveLogsBucket'].nil?

describe s3_bucket(ENV['rArchiveLogsBucket']) do
  it { should have_versioning_enabled }
end