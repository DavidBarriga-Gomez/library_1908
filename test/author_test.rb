require './lib/book'
require './lib/author'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class AuthorTest < Minitest::Test
  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_existence
    assert_instance_of Author, @charlotte_bronte
  end

  def test_initialized
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
    assert_equal [], @charlotte_bronte.books
  end

  def test_method_write
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    assert_equal Book, @jane_eyre.class
    assert_equal "Jane Eyre", @jane_eyre.title
    @villette = @charlotte_bronte.write("Villette", "1853")
    assert_equal [@jane_eyre, @villette], @charlotte_bronte.books
  end
end
