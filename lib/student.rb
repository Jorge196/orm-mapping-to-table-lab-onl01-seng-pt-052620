class Student
  attr_accessor :name, :grade
  attr_reader :id

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  def initialize(name, grade)
    @name = name
    @grade = grade
    @id = id
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS students(
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade TEXT
      );
    SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = <<-SQL
      DROP TABLE IF EXISTS students;
      SQL
      DB[:conn].execute(sql)
  end

  def save
    sql = <<-SQL
    INSERT INTO students (name, grade)
    VALUES (?,?)
    SQL
    DB[:conn].execute(sql, self.name, self.grade)

    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
  end

  def self.create 








  # old OO way of doing this
  @@all = []

  def self.all
    @@all
  end
  # ORM way of doing it
  def self.all
    # get all students from db
    # create a student object for each
    # return array of students object
    # SELECT * FROM students;
  end
end
