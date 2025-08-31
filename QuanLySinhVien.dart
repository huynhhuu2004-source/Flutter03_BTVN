import 'dart:io';

class SinhVien{
  String hoTen;
  double diemToan,diemLy,diemHoa;

  SinhVien(this.hoTen,this.diemToan,this.diemHoa,this.diemLy);

  double get diemTrungBinh{
    return (diemToan+diemLy+diemHoa)/3;
  }

  String get xepLoai{
    if(diemTrungBinh>=9) {
      return "Xuat Sac";
    }
    else if(diemTrungBinh>=7){
      return "Gioi";
    }
    else if(diemTrungBinh>=5){
      return "Kha";
    }
    else {
      return "Kem";
    } 

  }

  void nhapThongTin(){
    stdout.write("Nhap ho ten: ");
    hoTen=stdin.readLineSync()??"";

    do{
    stdout.write("Nhap diem toan: ");
    diemToan=double.parse(stdin.readLineSync()??"")??0;
    stdout.write("Nhap diem ly: ");
    diemLy=double.parse(stdin.readLineSync()??"")??0;
    stdout.write("Nhap diem hoa: ");
    diemHoa=double.parse(stdin.readLineSync()??"")??0;
      if (diemToan < 0 || diemToan > 10 || diemLy < 0 || diemLy > 10 || diemHoa < 0 || diemHoa > 10) {
        print(" Diem khong hop le nhap lai (0-10).");
      }

    }while(diemToan<0 || diemToan >10 || diemLy<0 || diemLy >10 ||diemHoa<0 || diemHoa >10);
  }

  void xuatThongTin(){
    print("--------Thong tin sinh vien---------");
    print("Ho Ten sinh vien: ${this.hoTen}");
    print("Diem toan: ${this.diemToan}");
    print("Diem ly: ${this.diemLy}");
    print("Diem hoa: ${this.diemHoa}");
    print("Diem trung binh 3 mon: ${diemTrungBinh}");
    print("Xep loai hoc sinh: ${xepLoai}");  
    print("------------------------------------");
  }
}

void main(){
    List<SinhVien> danhSachSinhVien=[];
    int choice;

    while (true) {
    print("------------------Quan ly sinh vien ------------");
    print("1. Them sinh vien");
    print("2. Hien thi danh sach sinh vien");
    print("3. Tim sinh vien co diem trung binh cao nhat");
    print("4. Thoat khoi chuong trinh");
    print("-------------------------------------------------");
    stdout.write("Nhap lua chon: ");
    choice = int.tryParse(stdin.readLineSync() ?? "") ?? 5;
    

    switch (choice) {
      case 1:
        SinhVien sv=new SinhVien("", 0, 0, 0) ;
        print("");
        print("Nhap thong tin sinh vien:");
        sv.nhapThongTin();
        danhSachSinhVien.add(sv);
        print("Them sinh vien thanh cong");
        print("");
        break;

      case 2:
        print("");
        if (danhSachSinhVien.isEmpty) {
          print("Danh sach chua co sinh vien");
        }
         else {
          print("----------------- Danh sach sinh vien -----------");
            for (SinhVien sv in danhSachSinhVien) {
              sv.xuatThongTin();
            }
          print("--------------------------------------------------");
        }
        print("");
        break;

      case 3:
        print("");
        if (danhSachSinhVien.isEmpty) {
          print("Danh sách rỗng!");
        } 
        else {
          SinhVien? svMax ;
            for (var sv in danhSachSinhVien) {
              if ( svMax==null ||sv.diemTrungBinh > svMax.diemTrungBinh) {
                svMax = sv;
              }
          }

          if(svMax==null){
            print("danh sach chua co sinh vien!");
          }
          else {
            print("Sinh vien xuat sac nhat: ");
            svMax.xuatThongTin();
          }
        }
        print("");
        break;

      case 4:
        print("");
        print("Dung chuong trinh!!!");
        print("");
        return; 

      default:
        print("Lua chon khong hop le !! Xin lua chon lai");
    }
  }
}