class Student
  attr_reader :name, :age, :scores
  def initialize(student_data)
    @name = student_data[:name]
    @age = student_data[:age]
    @scores = []
  end
  def log_score(score)
    @scores << score
  end
  def grade
    sum = 0
    @scores.each do |score|
      sum += score
    end
    grade = sum.to_f / @scores.length
  end
  
end
