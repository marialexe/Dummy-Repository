require('minitest/autorun')
require('minitest/pride')
require_relative('./student')

# Part A - Student Class Tests 
class TestStudent < MiniTest::Test

def setup
  @student=Student.new("Mariska", 12)
end

def test_student_name
  assert_equal("Mariska",@student.name)
end

def test_student_cohort
  assert_equal(12,@student.cohort)
end

def test_set_name
  @student.set_name("Louisa")
  assert_equal("Louisa",@student.name)
end

def test_set_cohort_no
  @student.set_cohort_no(10)
  assert_equal(10,@student.cohort)
end

def test_talking_student
  answer=@student.talking_student(true)
  assert_equal("Yes, I can talk!",@student.talking_student(answer))
end

def test_fav_program_language

  answer=@student.fav_program_language("Python")
  assert_equal("I love Python",@student.fav_program_language(answer))
  assert_equal("Mariska",@student.name)
end

end
