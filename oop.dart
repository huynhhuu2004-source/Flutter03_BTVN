class Person {
  int id;
  String name;
  int age;
  String gender;

  Person(this.id, this.name, this.age, this.gender);
}

class Student extends Person {
  int grade;
  double score;

  Student(super.id, super.name, super.age, super.gender, this.grade, this.score);

  void thongTinSinhVien() {
    print("----- Thông tin sinh viên ${name} -----");
    print("ID: ${id}");
    print("Tên: ${name}");
    print("Tuổi: ${age}");
    print("Giới tính: ${gender}");
    print("Lớp: ${grade}");
    print("Điểm: ${score}\n");
  }
}

class Teacher extends Person {
  String subject;
  double salary;

  Teacher(super.id, super.name, super.age, super.gender, this.subject, this.salary);

  void thongTinGiaoVien() {
    print("----- Thông tin giáo viên ${name} -----");
    print("ID: ${id}");
    print("Tên: ${name}");
    print("Tuổi: ${age}");
    print("Giới tính: ${gender}");
    print("Môn dạy: ${subject}");
    print("Lương: ${salary}\n");
  }
}


class Classroom {
  int id;
  String name;
  List<Student> students;
  Teacher teacher;

  Classroom(this.id, this.name, this.students, this.teacher);

  void themSinhVienInClass(Student hs) {
    students.add(hs);
  }

  void themGiaoVienInClass(Teacher tc) {
    teacher = tc;
  }

    double diemTrungBinhLop() {
    if (students.isEmpty) 
      return 0;
    
    double sum = 0;
    for (var hs in students) {
      sum += hs.score;
    }
    return (sum / students.length);
  }

  void thongTinLopHoc() {
    print("===== Thông tin lớp học ${name} =====");
    print("ID lớp: ${id}");
    print("Tên lớp: ${name}");
    print("\n--- Giáo viên chủ nhiệm ---");
    teacher.thongTinGiaoVien();

    print("--- Danh sách học sinh ---");
    for (var hs in students) {
      hs.thongTinSinhVien();
    }
  }
}

void main() {
  Teacher gv = Teacher(1, "Huynh Lai A", 20, "Nam", "Toán", 15);

  Classroom Flutter = Classroom(1, "Flutter 03", [], gv);

  Student sv1 = Student(1, "Huynh Lai B", 21, "Nam", 03, 9);
  Student sv2 = Student(2, "Huynh Lai C", 22, "Nữ", 03, 8);
  Student sv3 = Student(3, "Huynh Lai D", 23, "Nam",03, 9);

  Flutter.themSinhVienInClass(sv1);
  Flutter.themSinhVienInClass(sv2);
  Flutter.themSinhVienInClass(sv3);

  Flutter.thongTinLopHoc();
  print("Diem trung binh cua ${Flutter.name}: ${Flutter.diemTrungBinhLop()}");
}