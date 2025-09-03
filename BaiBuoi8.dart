import 'dart:io';
//BÀI TẬP HÀM 
void themSanPham(List<Map<String,dynamic>> hh){
  stdout.write("Nhap ten san pham: ");
  String ten = stdin.readLineSync() ?? '';
  
  stdout.write("Nhap so luong: ");
  int soLuong = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  
  stdout.write("Nhap gia: ");
  double gia = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
  
  hh.add({
    "tenSP": ten,
    "soLuong": soLuong,
    "gia": gia,
  });
  print("Da them thanh cong vao gio hang");
}

void xuatThongTin(List<Map<String,dynamic>> hh){
  if(hh.isEmpty){
    print("Gio hang chua co thong tin san pham nao");
    return;
  }
  
  print("Thong tin Gio Hang: ");
  for (var sp in hh) {
    print("-------------");
    print("Ten: ${sp["tenSP"]}");
    print("So Luong: ${sp["soLuong"]}");
    print("Gia: ${sp["gia"]}");
    print("------------"); 
  }
}

void xoaSanPham(List<Map<String,dynamic>> hh){
  stdout.write("Nhap ten san pham muon xoa: ");
  String canxoa=stdin.readLineSync()??'';
  hh.removeWhere((list)=>list['tenSP'].toString().toLowerCase()==canxoa.toString().toLowerCase());

  int hh_bandau = hh.length;

    if (hh.length < hh_bandau) {
      print("Đã xóa thành công");
    } 
    else {
      print("Không tìm thấy sản phẩm để xóa");
    }
}

void suaSanPham(List<Map<String, dynamic>> gioHang,tenSP) {

  for (var sanPham in gioHang) {
    if (sanPham['tenSP'] == tenSP) {
      
      stdout.write("Nhập số lượng mới: ");
      sanPham['soLuong'] = int.parse(stdin.readLineSync()!);
      stdout.write("Nhập giá tiền mới: ");
      sanPham['gia'] = double.parse(stdin.readLineSync()!);
      print("Đã sửa sản phẩm thành công");
      return;
    }
  }
  
  print("Không có sản phẩm nào");
}

void tinhTongTien(List<Map<String, dynamic>> gioHang) {
  double tong = 0;
  for (var sanPham in gioHang) {
    tong = tong + sanPham['soLuong'] * sanPham['gia'];
  }
  print("Tổng tiền: $tong");
}

void main() {
    List<Map<String,dynamic>> listHangHoa=[];
    while(true){
      
      print("------------------------");
      print("Nhap lua chon chuc nang");
      print("1.Them san pham vao gio hang");
      print("2.Xoa San Pham gio hang ");
      print("3.Sua San Pham trong gio hang ");
      print("4.Hien thi gio hang");
      print("5.Dung chuong trinh!!!!");
      print("6 Tinh tong tien");
      print("------------------------");
      int choice;
      choice=int.parse(stdin.readLineSync()??'')??5;
      switch(choice){
        case 1:
          print("");
          themSanPham(listHangHoa);

        break;
        
        case 2:
          xoaSanPham(listHangHoa);
        break;
        
        case 3:
          stdout.write("Nhập tên sản phẩm cần sửa: ");
          String tenSP = stdin.readLineSync()??'';
          suaSanPham(listHangHoa, tenSP);
        break;
        
        case 4:
          print("");
          xuatThongTin(listHangHoa);
          print("");
        break;
        
        case 5:
          print("");
          print("Chuong trinh da ket thuc ");
          print("");
        return;

        case 6:
         print("");
         tinhTongTien(listHangHoa);
         print("");
        break;

        default:
        print("Nhap lua chon chuc nang khong co!!");
        return;
      }
    }
}