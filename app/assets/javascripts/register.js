$(function() {
  $('#login-show').click(function() {
    $('#login-modal').fadeIn();
  });
  
  $('.signup-show').click(function() {
    $('#signup-modal').fadeIn();
  });
  
  // 「.close-modal」要素にclickイベントを設定してください
  $('.close-modal').click(function() {
    $('#login-modal').fadeOut();
    $('#signup-modal').fadeOut();
  });
  
});
