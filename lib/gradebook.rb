class Gradebook
  attr_reader :instructor, :courses
  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end
  def add_course(course)
    @courses << course
  end
  def list_all_students
    list = {}
      @courses.each do |course|
        list[course] = course.students
      end
      list
  end
  def students_below(threshold)
    below_threshold_students =[]
    @courses.each do |course|
      below_threshold_students += course.students.select { |student| student.scores.join.to_i < threshold}

    end
    below_threshold_students
  end
end