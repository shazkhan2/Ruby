document.addEventListener('DOMContentLoaded', function() {
    const notice = document.getElementById('notice');
    const alert = document.getElementById('alert');
  
    setTimeout(function() {
      if (notice) {
        notice.style.opacity = '0';  
      }
      if (alert) {
        alert.style.opacity = '0'; 
      }
    }, 3000);  
  });
  