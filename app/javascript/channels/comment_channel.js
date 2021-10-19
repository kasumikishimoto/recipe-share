import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>${data.content.comment}</p>`;
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('recipe_comment_comment');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value = '';
   }
});