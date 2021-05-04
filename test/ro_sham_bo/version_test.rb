# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/ro_sham_bo/version'

class VersionTest < Test::Unit::TestCase
  def test_to_s
    assert_match(/\d+\.\d+.\d+/, RoShamBo::Version.to_s)
  end

  def test_major
    assert_instance_of(Integer, RoShamBo::Version::MAJOR)
  end

  def test_minor
    assert_instance_of(Integer, RoShamBo::Version::MINOR)
  end

  def test_patch
    assert_instance_of(Integer, RoShamBo::Version::PATCH)
  end
end
