def return_10()
  return 10
end


def add(a,b)
  add_result=a+b
  return add_result
end

def subtract(a,b)
  subtract_result=a-b
  return subtract_result
end

def multiply(a,b)
  multiply_result=a*b
  return multiply_result
end

def divide(a,b)
  divide_result=a/b
  return divide_result
end

def length_of_string(string)
  string_length=string.length
  return string_length
end

def join_string(string_1,string_2)
  joined_string=string_1 + string_2
  return joined_string
end

def add_string_as_number(string_1,string_2)
  return string_1.to_i + string_2.to_i  
end

def number_to_full_month_name(number)
  case number
    when 1 then return "January"
    when 2 then return "February"
    when 3 then return "March"
    when 4 then return "April"
    when 5 then return "May"
    when 6 then return "June"
    when 7 then return "July"
    when 8 then return "August"
    when 9 then return "September"
    when 10 then return "October"
    when 11 then return "November"
    when 12 then return "December"
    else return "Error! Required number between 1 and 12!!!"
  end
end

def number_to_short_month_name(number)
  case number
    when 1 then return "Jan"
    when 2 then return "Feb"
    when 3 then return "Mar"
    when 4 then return "Apr"
    when 5 then return "May"
    when 6 then return "Jun"
    when 7 then return "Jul"
    when 8 then return "Aug"
    when 9 then return "Sep"
    when 10 then return "Oct"
    when 11 then return "Nov"
    when 12 then return "Dec"
    else return "Error! Required number between 1 and 12!!!"
  end
end

#Further

#Given the length of a side of a cube calculate the volume
def volume_of_cube(cube_side)
  cube_vol=cube_side**3
  return cube_vol
end

#Given the radius of a sphere calculate the volume
def volume_of_sphere(radius)
  sphere_vol=1.33333*(Math::PI)*(radius**3)
  sphere_vol=sphere_vol.to_i
  return sphere_vol
end

#Given a value in farenheit, convert this into celsius.
def fahrenheit_to_celsius(tempF)
  tempC=(tempF-32)*0.55555
  tempC_int=tempC.to_i
  tempC_decimal=(tempC-tempC_int).abs
  return tempC.floor if ((tempC_decimal<0.5) && (tempC>=0))||((tempC_decimal>=0.5) && (tempC<0))
  return tempC.ceil if ((tempC_decimal>=0.5) && (tempC>=0))||((tempC_decimal<0.5) && (tempC<0))
end

