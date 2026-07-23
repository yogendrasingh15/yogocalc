require 'test_helper'
require 'stringio'

class AssetTest < ActiveSupport::TestCase
  self.fixture_path = nil

  test 'can attach a file and expose a public URL' do
    asset = Asset.new(title: 'Sample asset')
    asset.file.attach(
      io: StringIO.new('hello world'),
      filename: 'hello.txt',
      content_type: 'text/plain'
    )

    assert asset.file.attached?
    assert_equal 'hello.txt', asset.file.filename.to_s
    assert asset.file_url.present?
  end
end
