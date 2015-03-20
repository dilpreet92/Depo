function ChatController(elements) {
  this.messageQueue = [];
  this.chatContainer = elements.chatContainer;
  this.usersList = elements.usersList;
  this.sendButton = elements.sendButton;
  this.dispatcher = new WebSocketRails(this.chatContainer.data('uri'), true);
};

ChatController.prototype.init = function() {
  this.dispatcher.on_open = this.createGuestUser();
  this.dispatcher.trigger('new_user', { "user_name": this.user_name });
  this.bindEvents();
};

ChatController.prototype.bindEvents = function() {
  var _this = this;
  _this.dispatcher.bind('new_message', function(message){
    _this.new_message(message);
  });
  _this.dispatcher.bind('user_list', function(users) {
    _this.update_user_list(users);
  });
  this.sendButton.on('click', function(e){
    _this.send_message(e);
  });
  // $('#article').on('click', function() {
  //   _this.dispatcher.trigger('articles.create');
  // });
};

ChatController.prototype.update_user_list = function(userList) {
  var userHtml = ""
  for (i in userList) {
    userHtml = userHtml + "<li>"+ userList[i] +"</li>";
  }
  this.usersList.append(userHtml);
};

ChatController.prototype.new_message = function(message) {
  this.messageQueue.push(message);
  this.appendMessage(message);
};

ChatController.prototype.appendMessage = function(message) {
  var div = '<div> <label class="label label-info">'+ message.received + message.user_name + '</label>&nbsp' + message.msg_body + '</div>';
  this.chatContainer.append(div);
};

ChatController.prototype.send_message = function(event) {
  event.preventDefault();
  message = $('#message').val();
  this.dispatcher.trigger('new_message', { "user_name": this.username, "message_body": message });
  $('#message').val('');
};

ChatController.prototype.createGuestUser = function() {
  var rand_num = Math.floor(Math.random()*1000);
  this.user_name = "Guest_" + rand_num;
  $('.username').text('Hi ' + this.user_name);
  $('#user_name').val(this.user_name);
};

$(document).ready(function() {
  var elements = {
    'chatContainer' : $('#chat'),
    'usersList' : $('.user-list'),
    'sendButton' : $('#send')
  };
  var chat = new ChatController(elements);
  chat.init();
});