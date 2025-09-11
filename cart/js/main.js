const plus = document.querySelector(".plus")
minus = document.querySelector(".minus")
num = document.querySelector(".num")

let a = 1;

plus.addEventListener("click",()=>{
    a++;
    a = (a < 10) ? "0" + a : a;
    num.innerText = a;
    console.log(a);
});
minus.addEventListener("click",()=>{
    if(a > 1) {
    a--;
    a = (a < 10) ? "0" + a : a;
    num.innerText = a;
    }
});

window.addEventListener('DOMContentLoaded', function() {
    // Lấy phần tử overlay và content
    var overlay = document.querySelector('.overlay');
    var content = document.querySelector('.content');
  
    // Ẩn overlay và hiển thị nội dung sau 1 giây
    setTimeout(function() {
        overlay.style.opacity = 0;
        overlay.style.visibility = 'hidden';
        content.classList.add('show');
    }, 1000);
  });