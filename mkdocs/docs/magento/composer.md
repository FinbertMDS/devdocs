# Overview
This is our developer docs about How to install Magento extension by Composer:

Solution:
1. Dùng [Satis](https://getcomposer.org/doc/articles/handling-private-packages-with-satis.md) để build 1 file packages.json tĩnh bao gồm tất cả các repository cần thiết

2. Build Satis và đặt trên domain: https://packages.magestore.com Phần quyền server chỉ cho phép IP của Magestore đọc đến server này (đặc biệt là file packages.json)
Ví dụ dùng .htaccess:
```
order deny,allow
deny from all
allow from 128.199.161.147
```
3. Trỏ domain : https://repo.magestore.com đến 1 thư mục chưa file packages.json rỗng dạng:
```
{
    "packages": []
}
```

4. Phân quyền thư mục repo để: Chặn toàn bộ quyền truy cập đến thư mục (chuyển hướng về trang chủ magestore chẳng hạn), riêng request đến https://repo.magestore.com/packages.json thì redirect về 1 action trên magento 2  (site Magstore) để thực hiện authorization + build content cho packages.json
Ví dụ action: https:/magestore.com/mscomposer/packages/find/

5.  Tại action này sẽ yêu cầu nhập thông tin authorization để xác thực. Thông tin gồm public key + private key user generate từ account (Giống magento/amasty )

6. Nếu xác thực thành công sẽ return về nội dung các packages được phép truy cập gồm:
Danh sách package define ở bước 1 (all package của repo) và filter đi chỉ cho truy cập các package mà khách hàng đã mua

7. Hệ thông quản lý packages trên magestore sẽ bao gồm:
- [Frontend] 1 page để customer view list các package họ có thể cài qua composer
- [Frontend] 1 page cho customer generate access keys: https://prnt.sc/kqaanl
- [Admin] Settings: enable/ setup domain đã dùng để build statis: https://prnt.sc/kqaaz8
- [Admin] Package list: https://prnt.sc/kqab7d
- [Admin] Package detail: https://prnt.sc/kqabcx
- [Admin] Link package với product https://prnt.sc/kqabh1 (mua sp thì đc access package)
- [Admin] Thông tin repo: https://prnt.sc/kqabsg
- [Admin] Assign package cho repo: https://prnt.sc/kqabu6  
Có thể auto generate file config cho Satis để tự build lại package khi thông tin repo thay đổi / khi mình release version mới