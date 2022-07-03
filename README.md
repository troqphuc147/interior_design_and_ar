<h1>ARFurni</h3>

[![tag](https://img.shields.io/badge/-furniture-F44336)](https://github.com/ltk84/ViPT)
[![tag](https://img.shields.io/badge/-interior-F44336)](https://github.com/ltk84/ViPT)
[![tag](https://img.shields.io/badge/-ar-F44336)](https://github.com/ltk84/ViPT)
[![tag](https://img.shields.io/badge/-chat-F44336)](https://github.com/ltk84/ViPT)
[![os](https://img.shields.io/badge/-android-32DE84)](https://github.com/troqphuc147/interior_design_and_ar)
[![framework](https://img.shields.io/badge/-dart-2196F3)](https://github.com/troqphuc147/interior_design_and_ar)
[![framework](https://img.shields.io/badge/-flutter-2196F3)](https://github.com/troqphuc147/interior_design_and_ar)

[![school](https://img.shields.io/badge/school-UIT-3f6cb6)](https://www.uit.edu.vn/)
[![subject](https://img.shields.io/badge/subject-PROJECT1-3f6cb6)](https://www.uit.edu.vn/)
[![contributors](https://img.shields.io/badge/contributors-2-1d9583)](#nhóm)
<br>

<p align="center">
 <img src="assets\images\white_logo.png" alt="ARFurni" height = "300"></a>
</p>
<p align="center">
<b>Augmented Reality Furniture</b>
<br/>
<i>Đây là một đồ án môn học</i>
</p>


<h3 align="center">AR là một công nghệ đầy hứa hẹn đang làm cho lối sống của con người trở nên hiện đại và dễ dàng hơn. Biết được lợi thế đó, chúng tôi đã nghiên cứu xây dựng và phát triển ứng dụng này.</h3>

## 📝 Mục lục

- [Giới thiệu](#giới-thiệu)
- [Bắt đầu](#bắt-đầu)
	- [Điều kiện tiên quyết](#điều-kiện-tiên-quyết)
	- [Cài đặt](#cài-đặt)
- [Giao diện](#giao-diện)
- [Tính năng](#tính-năng)
    - [Xác thực người dùng](#xác-thực-người-dùng)
    - [Xem danh sách các sản phẩm](#xem-danh-sách-các-sản-phẩm)
    - [Xem thông tin chi tiết của sản phẩm](#xem-thông-tin-chi-tiết-của-sản-phẩm)
    - [Đánh giá sản phẩm](#đánh-giá-sản-phẩm)
    - [Thêm sản phẩm vào danh sách yêu thích của bạn](#thêm-sản-phẩm-vào-danh-sách-yêu-thích-của-bạn)
    - [Xem sản phẩm qua camera](#xem-sản-phẩm-qua-camera)
    - [Nhắn tin với nhân viên tư vấn](#nhắn-tin-với-nhân-viên-tư-vấn)
    - [Xem danh sách các sản phẩm đã đánh giá](#xem-danh-sách-các-sản-phẩm-đã-đánh-giá)
    - [Phản hồi về sản phẩm với nhà phát hành](#phản-hồi-về-sản-phẩm-với-nhà-phát-hành)
- [Công nghệ](#công-nghệ)
- [Nhóm](#nhóm)
- [Đóng góp](#đóng-góp)
- [Hướng phát triển](#hướng-phát-triển)
- [Demo](#demo)
- [Giấy phép](#giấy-phép)

## Giới thiệu

ARFurni là một ứng dụng của công ty MyFurni, tư vấn cho người dùng chọn lựa nội thất phù hợp với căn nhà của mình. Các sản phẩm này được phân phối độc quyền từ 1 công ty MyFurni.

ARFurni mang đến cho người dùng những sản phẩm mới nhất, hiện đại nhất. Đồng thời mang đến cho người dùng cái nhìn thực tế nhất về sản phẩm (thông qua công nghệ AR).

ARFurni còn tư vấn trực tiếp với người dùng thông qua ứng dụng, giúp cho việc chọn lựa sản phầm của người dùng nhanh nhất có thể.

## Bắt đầu
### Cài đặt

Tải file .apk tại [đây](https://github.com/troqphuc147/interior_design_and_ar/releases/download/0.0.1/app-release.apk) và cài đặt lên điện thoại (Android).
### **Dành cho việc phát triển ứng dụng:** 
Cài đặt flutter theo hướng dẫn tại [đây](https://flutter.dev/docs/get-started/install).

Clone repository của ViPT từ github về máy:	

    $ git clone https://github.com/troqphuc147/interior_design_and_ar.git

Chạy lệnh bên dưới bên trong thư mục của project ViPT:

    $ flutter pub get

Sau đó mở công cụ phát triển (development tool) và chạy ứng dụng trên máy ảo.

*Có thể tham khảo thêm tại [đây](https://flutter.dev/docs/get-started) (Flutter documentation).*

## Giao diện
<img width="200" src="assets\infor\intro1.jpg"></a>
<img width="200" src="assets\infor\intro2.jpg"></a>
<img width="200" src="assets\infor\sign_in.jpg"></a>
<img width="200" src="assets\infor\loading.jpg"></a>
<img width="200" src="assets\infor\home.jpg"></a>
<img width="200" src="assets\infor\search.jpg"></a>
<img width="200" src="assets\infor\list_chair.jpg"></a>
<img width="200" src="assets\infor\search_in_list.jpg"></a>
<img width="200" src="assets\infor\filter_in_list.jpg"></a>
<img width="200" src="assets\infor\product_detail.jpg"></a>
<img width="200" src="assets\infor\rating0.jpg"></a>
<img width="200" src="assets\infor\rating0.5.jpg"></a>
<img width="200" src="assets\infor\rating.jpg"></a>
<img width="200" src="assets\infor\ar1.jpg"></a>
<img width="200" src="assets\infor\ar2.jpg"></a>
<img width="200" src="assets\infor\favorite.jpg"></a>
<img width="200" src="assets\infor\search_favorite.jpg"></a>
<img width="200" src="assets\infor\sort.jpg"></a>
<img width="200" src="assets\infor\filter.jpg"></a>
<img width="200" src="assets\infor\chat0.jpg"></a>
<img width="200" src="assets\infor\chat.jpg"></a>
<img width="200" src="assets\infor\admin_chat.jpg"></a>
<img width="200" src="assets\infor\profile.jpg"></a>
<img width="200" src="assets\infor\help.jpg"></a>
<img width="200" src="assets\infor\list_product_rating.jpg"></a>
<img width="200" src="assets\infor\sent_mail0.jpg"></a>
<img width="200" src="assets\infor\sent_email.jpg"></a>

## Tính năng

### Xác thực người dùng
* Người dùng truy cập hệ thống với tài khoản Google/Facebook.
### Xem danh sách các sản phẩm
* Người dùng có thể xem danh sách các sản phẩm theo category, theo độ phổ biến hay thời gian ra sản phẩm.
* Ngoài ra người dùng có thể lọc trong danh sách các sản phẩm này theo rating và giá cả.
* Có thể sắp xếp danh sách theo thứ tự mong muốn nhưng theo số tiền tăng dần ...
### Xem thông tin chi tiết của sản phẩm
* Người dùng sẽ xem được thông tin của 1 sản phẩm bất kì khi click vào hình ảnh sản phẩm đó.
* Thông tin của sản phẩm gồm: Tên, Ratings, giá trị, mô tả...
### Đánh giá sản phẩm
* Người dùng có thể đánh giá sản phẩm bằng cách nhấn vào "Rating for product" sau đó chọn số sao và nhấn "Rating".
* Mỗi tài khoản chỉ được rating cho sản phẩm 1 lần.
### Thêm sản phẩm vào danh sách yêu thích của bạn
* Bất cứ cart nào trên ứng dụng có hình trái tim, người dùng có thể ấn vào đó để thêm vào/xóa khỏi danh sách yêu thích của mình.
* Danh sách yêu thích sẽ được cập nhật ở tab thứ 2 trong giao diện.
### Xem sản phẩm qua camera
* Ứng dụng công nghệ AR, chúng tôi đã hoàn thiện tính năng này.
* Khi người dùng ở giao diện thông tin chi tiết của sản phẩm, hãy bấm vào "View on camera" và sau đó làm theo hướng dẫn để xm được sản phẩm.
### Nhắn tin với nhân viên tư vấn.
* Người dùng có thể nhắn tin hỏi trực tiếp nhân viên tư vấn để nhận đươc sự giúp đỡ kịp thời và hợp lý, rút ngắn thời gian tìm kiếm sản phẩm.
### Xem danh sách các sản phẩm đã đánh giá
* Người dùng có thể xem lại danh sách các sản phẩm mình đã rating 
### Phản hồi về sản phẩm với nhà phát hành
* Người dùng có thể gửi mail với người quản lý sản phẩm thông qua "Contact us".
* Nếu ứng dụng có vấn đề người dùng có thể liên hệ với nhà phát hành trong phần "About us".

## Công nghệ

- **Languages:** [Dart]().
- **Framework:** [Flutter]().
- **Tool:** 
  * [Unity3D]().
  * [Visual Studio Code]().
  * [Android Studio]().
- **Database:** [Firebase]().

## Nhóm

ViPT được thực hiện bởi:
- Huỳnh Trọng Phục *(troqphuc147)*: 19522030@gm.uit.edu.vn
- Hoàng Dận Quang *(HoangDanQuang)*: 19522092@gm.uit.edu.vn

## Đóng góp

Hãy cứ tự nhiên cùng tham gia vào việc phát triển ứng dụng này: [Open an issue](https://github.com/ltk84/ViPT/issues/new).

1. Fork project.
2. Tạo branch cho tính năng.

```sh
git checkout -b feature/super-feature
```

3. Commit thay đổi của bạn.

```sh
git commit -m "Add super feature"
```

4. Push lên remote branch.

```sh
git push origin feature/super-feature
```

5. Tạo một Pull Request.

## Hướng phát triển

Ứng dụng thiết kế nội thất tích hợp công nghệ AR đã hoàn thành các chức năng đã đề ra tuy nhiên vẫn còn chưa hoàn thiện, còn nhiều khả năng mở rộng:
-	Xây dựng hệ thống quản lý cho người quản lý
-	Xây dựng hệ thống thương mại cho sản phẩm
-	Xây dựng hệ thống đề xuất dựa trên dữ liệu người dùng
-	Tối ưu hóa code để tăng tốc độ xử lý
-	Sưu tầm, thiết kế thêm các mô hình sản phẩm nội thất

## Demo

Xem demo tại [đây](https://drive.google.com/file/d/1tFW7lVzM7XJXccYmztcFnHc4IqHO-sI7/view?usp=sharing)
 
## Giấy phép

```
MIT License

Copyright (c) 2022 IT's Zoo Team

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

