<?php include "headerquantri.php";?>
<?php
  $host = getenv('DB_HOST');       // mysql-service
$user = getenv('DB_USERNAME');   // từ Secret
$pass = getenv('DB_PASSWORD');   // từ Secret
$db   = getenv('DB_DATABASE');   // từ Secret

$conn = mysqli_connect($host, $user, $pass, $db);
  //check connection
  
  if (!$conn) {
      die("connection failer" . mysqli_connect_error());
  }
//lấy thông tin cần xóa
$tendangnhap=$_GET['tendangnhap'];
$sql="DELETE FROM  `taikhoan` WHERE tendangnhap='$tendangnhap' ";
$result=mysqli_query($conn,$sql);


//thông báo
if($result) {
    echo"<script>alert('xóa thành công')</script>";
    echo "<script>window.history.back()</script>";
}
else
{
    echo" <script>alert('lỗi')</script>";

}
?>