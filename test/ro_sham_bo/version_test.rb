# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/ro_sham_bo/version"

class RoShamBo
  class VersionTest < Test::Unit::TestCase
    GEMFILE_VERSION_REGEX = %r{^\s*ro_sham_bo\s+\(#{RoShamBo::VERSION}\)}o

    def test_version_exists_and_follows_semantiv_versioning
      assert RoShamBo::VERSION
      assert_match RoShamBo::Version.to_s, RoShamBo::VERSION
    end

    def test_to_a
      assert_instance_of(Array, RoShamBo::Version.to_a)
      assert_equal(
        [
          RoShamBo::Version::MAJOR,
          RoShamBo::Version::MINOR,
          RoShamBo::Version::PATCH
        ],
        RoShamBo::Version.to_a
      )
    end

    def test_to_h
      assert_instance_of(Hash, RoShamBo::Version.to_h)
      assert_equal(
        {
          major: RoShamBo::Version::MAJOR,
          minor: RoShamBo::Version::MINOR,
          patch: RoShamBo::Version::PATCH
        },
        RoShamBo::Version.to_h
      )
    end

    def test_to_s
      assert_instance_of(String, RoShamBo::Version.to_s)
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

    def test_gemfile_lock_should_contain_the_current_version
      refute_empty(
        File.readlines(
          File.join(__dir__, "..", "..", "Gemfile.lock")
        ).grep(GEMFILE_VERSION_REGEX)
      )
    end
  end
end
