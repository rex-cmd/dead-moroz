$(function(){
  console.log('we are here')
  $('#assessment-modal').on('hidden.bs.modal', function() {
    $('#form-rating li.star').each(function(i) {
      $(this).css('color', '#ccc');
    });
  });
//stars
    $('#form-rating li').on('mouseover', function() {
        let onStar = parseInt($(this).data('value'), 10);
        $(this).parent().children('li.star').each(function (i){
          if (i < onStar) {
            $(this).addClass('hover');
          } else {
            $(this).removeClass('hover');
          }
        });
      });
    
      $('#form-rating li').on('mouseout', function(){
        $('#form-rating li.star').each(function(){
          $(this).removeClass('hover');
        });
      });
    
      $('#form-rating li').on('click', function(){
        let onStar = parseInt($(this).data('value'), 10);
        $('#form-rating li.star').each(function(i) {
          $(this).css('color', '#ccc' );
          if (i < onStar) {
            $(this).css('color', '#FF912C');
            console.log(onStar)
          }
        });
        console.log(onStar)
        $('#rating').val(onStar);

      });
    
})