import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log("[comment_channel] data=%o", data);
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment_comment');
    comments.insertAdjacentHTML('beforeend', data.content);
    newComment.value = '';
    const submitBtn = document.getElementById('comment_submit');
    submitBtn.disabled = false;
   }
});