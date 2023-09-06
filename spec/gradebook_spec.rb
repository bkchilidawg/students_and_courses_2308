require 'rspec'
require './lib/course'
require './lib/student'
require './lib/gradebook'


RSpec.describe Gradebook do
  it 'exists' do 
    gradebook = Gradebook.new("Meg")
    expect(gradebook).to be_a Gradebook  
  end
  it 'has a course list' do
    gradebook = Gradebook.new("Meg")
    expect(gradebook.courses).to eq([])
  end
  describe '#add_courses' do
  
    it 'adds a course in its course list' do
      gradebook = Gradebook.new("Meg")
      calculus = Course.new("Calculus", 2)
      gradebook.add_course(calculus)

      expect(gradebook.courses.first).to be_a Course
    end
  end
  describe '#list_all_students' do
    it 'can list all students in the course' do
      gradebook = Gradebook.new("Meg")
      calculus = Course.new("Calculus", 2)
      history = Course.new("Histoy", 2)
      blaine = Student.new({name: "Blaine", age: 29})
      colin = Student.new({name: "Colin", age: 34})
      gradebook.add_course(calculus)
      gradebook.add_course(history)
      calculus.enroll(blaine)
      history.enroll(blaine)
      calculus.enroll(colin)
      
       expected_result = {
      calculus => [blaine, colin],
      history => [blaine]
        }
        expect(gradebook.list_all_students).to eq(expected_result)  
    end
  end
  describe '#students_below_threshold' do
    it 'can tell us who is passing the course' do 
      gradebook = Gradebook.new("Meg")
      calculus = Course.new("Calculus", 2)
      blaine = Student.new({name: "Blaine", age: 29})
      colin = Student.new({name: "Colin", age: 34})
      gradebook.add_course(calculus)
      calculus.enroll(blaine)
      calculus.enroll(colin)
      blaine.log_score(90)
      colin.log_score(60)
      expect(gradebook.students_below(85)).to eq([colin])
    end
  end
end