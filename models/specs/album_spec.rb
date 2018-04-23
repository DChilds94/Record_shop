require("minitest/autorun")
require_relative("../album.rb")
require_relative("../artist.rb")


class TestAlbum < MiniTest::Test

def setup()
  @album1 = Album.new({
    "title" => "Album_title",
    "stock" => 50,
    "artist_id" => "artist_id"
    })
  @album2 = Album.new({
    "title" => "Album_title",
    "stock" => 0,
    "artist_id" => "artist_id"
    })
  @album3 = Album.new({
    "title" => "Album_title",
    "stock" => 49,
    "artist_id" => "artist_id"
    })
  @album4 = Album.new({
    "title" => "Album_title",
    "stock" => 9,
    "artist_id" => "artist_id"
    })
  @album5 = Album.new({
    "title" => "Album_title",
    "stock" => 1,
    "artist_id" => "artist_id"
    })
end

  def test_check_stock_high()
    assert_equal("High", @album1.check_stock)
  end

  def test_check_stock_zero()
    assert_equal("Out of stock", @album2.check_stock)
  end

  def test_check_stock_medium()
    assert_equal("Medium", @album3.check_stock)
  end

  def test_check_stock_low()
    assert_equal("Low", @album4.check_stock)
  end

  def test_check_stock__one()
    assert_equal("Low", @album5.check_stock)
  end

end
