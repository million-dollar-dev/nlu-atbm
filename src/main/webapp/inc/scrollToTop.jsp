<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<button id="myBtn" title="Go to top" style="display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 999999;
  border: none;
  outline: none;
  background-color: #2AC37D;
  color: white;
  cursor: pointer;
  padding-top: 6px;
  width: 50px;
  height: 50px;
  font-size: 24px;
  font-weight: 100;
  line-height: 1.6;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.25);
  border-radius: 50%;"><ion-icon name="arrow-up-outline"></ion-icon></i></button>


<script>
    //Khi người dùng cuộn chuột thì gọi hàm scrollFunction
    window.onscroll = function() {scrollFunction()};
    // khai báo hàm scrollFunction
    function scrollFunction() {
        // Kiểm tra vị trí hiện tại của con trỏ so với nội dung trang
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            //nếu lớn hơn 20px thì hiện button
            document.getElementById("myBtn").style.display = "block";
        } else {
            //nếu nhỏ hơn 20px thì ẩn button
            document.getElementById("myBtn").style.display = "none";
        }
    }
    //gán sự kiện click cho button
    document.getElementById('myBtn').addEventListener("click", function(){
        //Nếu button được click thì nhảy về đầu trang
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
    });
</script>



