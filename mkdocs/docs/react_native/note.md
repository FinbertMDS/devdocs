# Overview
This is our developer docs about Some note about React native

1. Jest
    - When install Jest for React native can has some error, follow links to fix:
        - [https://github.com/facebook/jest/issues/2663#issuecomment-317109798](https://github.com/facebook/jest/issues/2663#issuecomment-317109798)
        - [https://jestjs.io/docs/en/webpack#handling-static-assets](https://jestjs.io/docs/en/webpack#handling-static-assets)
        - [https://github.com/itinance/react-native-fs/issues/404#issuecomment-411254352](https://github.com/itinance/react-native-fs/issues/404#issuecomment-411254352)

    - All source, you can find at [here](https://github.com/FinbertMDS/devdocs/tree/develop/mkdocs/docs/react_native/public)

2. [Putting native in React Native on Android](https://brightinventions.pl/blog/write-native-in-react-native/)

3. Thao tác với ảnh trong Android

    - Sử dụng thư viện [Image Picker](https://github.com/react-native-community/react-native-image-picker) để lấy ảnh từ trong thư viện và chụp ảnh từ camera.
    
    Tuy nhiên, Android dù chụp ảnh ngang hay dọc thì đều lưu ở cùng width và height, chỉ khác nhau ở thuộc tính của Image về Orientation. (Nếu sử dụng Android studio, hay các công cụ lấy ảnh trực tiếp từ điện thoại sẽ lấy được ảnh gốc và có thể bị ngược, không giống với khi nhìn trong điện thoại).

    Tham khảo [bài viết này](https://qiita.com/RichardImaokaJP/items/385beb77eb39243e50a6)
    
    ![](./public/photo_images_orient_flag.gif)



    Sử dụng thư viện [Exif](https://www.npmjs.com/package/react-native-exif) để lấy được thông tin như `ImageWidth`, `ImageHeight`, `Orientation`. Từ đó dựa vào Orientation để xác định Width, Height giống với khi view trên điện thoại.