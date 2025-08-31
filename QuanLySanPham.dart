import 'dart:io';

class SanPham {
  String tenSP;
  int giaTien;
  int soLuong;

  SanPham(this.tenSP, this.giaTien, this.soLuong);

  void nhapThongTin(){
       stdout.write("Nhap ten san pham: ");
          tenSP = stdin.readLineSync() ?? "";
        stdout.write("Nhap gia tien: ");
          giaTien = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
        stdout.write("Nhap so luong: ");
          soLuong = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
  }

  void xuatThongTinSp(){
      print("");
      print("--------------------------------");
      print( "Ten San Pham: ${tenSP}");
      print( "Gia tien: ${giaTien}");
      print( "So luong san pham: ${soLuong}");
      print("--------------------------------");
      print("");
  }
}

void main(List<String> args) {
  List<SanPham> danhSachSanPham = [];

  while (true) {
    print("------------- Danh Sach San Pham ------------");
    print("1. Them san pham");
    print("2. Hien thi danh sach san pham");
    print("3. Tim san pham theo ten");
    print("4. Ban san pham");
    print("5. Thoat khoi chuong trinh");
    print("-------------------------------------------");
    stdout.write("Chon chuc nang: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print("");
        print("Nhap thong tin sinh vien:");
        SanPham sp=new SanPham("", 0, 0);
        sp.nhapThongTin();
        danhSachSanPham.add(sp);
        print("Them san pham thanh cong");
        print("");
        break;

      case '2':
        print("");
        if (danhSachSanPham.isEmpty) {
          print("Danh sach san pham trong !!!");
        } 
        
        else {
          print("---------DANH SACH SAN PHAM ----------");
          for (SanPham sp in danhSachSanPham) {
            sp.xuatThongTinSp();
          }
        }
        print("");
        break;

      case '3':
        print("");
        stdout.write("Nhap ten san pham can tim: ");
        String searchSP = stdin.readLineSync() ?? "";
        var ketQua = danhSachSanPham .where((sanpham) => sanpham.tenSP.toLowerCase() == searchSP.toLowerCase());
        
        if (ketQua.isEmpty) {
          print("Khong tim thay san pham can tim !!!!");
        } 
        else {
          print("Da tim thay san pham:");
            for(SanPham sp in ketQua){
              sp.xuatThongTinSp();
            }
        }
        print("");
        break;

      case '4':
        print("");
        stdout.write("Nhap ten san pham can ban: ");
        String tenBan = stdin.readLineSync() ?? "";

        var spBan = danhSachSanPham.firstWhere( (sp) => sp.tenSP.toLowerCase() == tenBan.toLowerCase());

        if (spBan.tenSP.isEmpty) {
          print("San pham khong ton tai!");
        } else {
          stdout.write("Nhap so luong can ban: ");
          int soLuongBan = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

          if (soLuongBan <= 0) {
            print("So luong ban khong hop le!");
          } else if (soLuongBan > spBan.soLuong) {
            print("Khong du hang trong kho!");
          } else {
            spBan.soLuong -= soLuongBan;
            print("Da ban $soLuongBan san pham. So luong ton con lai: ${spBan.soLuong}");
          }
        }
        print("");
        break;

      case '5':
        print("");
        print("Dung chuong trinh!!!");
        print("");
        return; 

      default:
        print("Lua chon khong hop le !! Xin lua chon lai");
    }
  }
}
