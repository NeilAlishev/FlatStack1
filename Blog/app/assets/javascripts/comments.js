$(document).on('page:change', function() {
	$('#show-comments').click(function(event) {
		event.preventDefault();
		$('.comments-section').slideToggle();
		$('#comment_content').focus();
		var text = $('#show-comments').text();
		if (text == 'Показать комментарии') {
			$('#show-comments').text('Скрыть комментарии');
		} else {
			$('#show-comments').text('Показать комментарии');
		}
	})
});