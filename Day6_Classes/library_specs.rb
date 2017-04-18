require('minitest/autorun')
require('minitest/pride')
require_relative('./library')

# Part C - Library Class Tests
class TestLibrary < MiniTest::Test

  def setup
  @library=Library.new(
    [
    {
      title: "Les Miserables",
      rental_details: {
        student_name: "Mariska",
        date: "01/03/17"
      }
    },
    {
      title: "Anna Karenina",
      rental_details: {
        student_name: "Dina",
        date: "05/04/17"
      }
    },
    {
      title: "Crime and Punishment",
      rental_details: {
        student_name: "Teresa",
          date: "12/12/16"
      }
    },
    {
      title: "War and Peace",
      rental_details: {
        student_name: "Sezen",
        date: "25/02/17"
      }
    }
    ])
  end

  def test_stock_count
    count = stock_count(@library)
    assert_equal(4, count)
  end

  def test_list_all_books_array
    # assert_equal(@library,@library.list_all_books_array(@Library))
    list_all_books_array(@library)
    count = stock_count(@library)
    assert_equal(4, count)
  end

end