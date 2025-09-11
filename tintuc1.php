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
    //B2:
    $sql_nhom = "SELECT * FROM `sanpham_nhom` ";
   
    //Bước 3
    $result_nhom = mysqli_query($conn, $sql_nhom);
    ?>	
        <div class="news">
            <div class="grid wide">
                <div class="news__items">
                    <div class="row">
                    <div class="col l-3">
                        <div class="news__category">
                            <div class="news__category-gr">
                                <h3 class="news__category-heading">Danh Mục Sản Phẩm</h3>
                                <ul class="news__category-list">
                               
                                    <?php while ($row_nhom = mysqli_fetch_assoc($result_nhom)) { ?>
                    <li><a class="news__category-items" href=" cat.php?nhom_id=<?php echo $row_nhom["id"]?>"><?php echo  $row_nhom["tennhom"] ?></a></li>
                        
                <?php } ?>
                                </ul>
                            </div>