$(function(){

  function buildHTML(comment){
    var html = `<div class="contents__under__a__comment">
                  <div class="contents__under__a__comment__user__nfo">
                    ${comment.user_name}
                    ${comment.created_at}
                  </div>
                  <div>
                    ${comment.text}
                    <a rel="nofollow" data-method="delete" href="/odais/${comment.odai_id}/copies/${comment.copy_id}/comments/${comment.id}">
                      <i aria-hidden="true" class="fas fa-trash-alt">
                      </i>
                    </a>
                  </div>
                </div>`
    return html;
  }


  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.contents__under__ajax').append(html);
      $('#comment_text').val(' ');
    })
    .fail(function(){
      alert('error');
      $('#comment_text').val(' ');
    })
  })
})
