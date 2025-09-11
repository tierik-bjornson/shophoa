<?php
class ketnoi {
    private $servername;
    private $username;
    private $password;
    private $dbname;
    protected $conn;

    // B1: Create connection
    function __construct() {
        // Lấy thông tin từ environment variables
        $this->servername = getenv('DB_HOST');       // tên Service MySQL trong K8s
        $this->username   = getenv('DB_USERNAME');   // từ Secret
        $this->password   = getenv('DB_PASSWORD');   // từ Secret
        $this->dbname     = getenv('DB_DATABASE');   // từ Secret

        $this->conn = mysqli_connect(
            $this->servername,
            $this->username,
            $this->password,
            $this->dbname
        );

        // check connection
        if (!$this->conn) {
            die("Connection failed: " . mysqli_connect_error());
        }
    }
}
?>
