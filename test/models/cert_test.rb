require 'test_helper'

class CertTest < ActiveSupport::TestCase

  def setup
    @cert = certs(:one)
  end

   test "title should be present " do
    @cert.title = ""
    assert @cert.invalid?
  end

   test "start_date should be present " do
    @cert.start_date = ""
    assert @cert.invalid?
  end

   test "expire_date should be present " do
    @cert.expire_date = ""
    assert @cert.invalid?
  end
end
