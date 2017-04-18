class Student

  def initialize(name, cohort)
    @name=name
    @cohort=cohort
  end

  # getter method for name
  def name
    return @name
  end

  # getter method for cohort
  def cohort
    return @cohort
  end

# setter method for name
  def set_name(new_name)
    @name=new_name
  end

# setter method for cohort
  def set_cohort_no(cohort_no)
    @cohort=cohort_no
  end

  def talking_student(talk)
    talk=true
    talk ? "Yes, I can talk!" : "Sorry, I can't talk!"
  end

  def fav_program_language(language)
    student_array=["Matthew","Mariska","Simon", "Craig", "Alaistar","Mark"]
    language_array=["Ruby","Python", "Java", "Java Script","Swift"]
    case @name
      when "Matthew" then return "I love #{language_array[0]}"
      when "Mariska" then return "I love #{language_array[1]}"
      when "Simon" then return "I love #{language_array[2]}"
      when "Craig" then return "I love #{language_array[3]}"
      when "Alaistar" then return "I love #{language_array[4]}"
      when "Mark" then return "I love #{language_array[5]}"
      else return "No favorite programming language!"
      end
  end

end


