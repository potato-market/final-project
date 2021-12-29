'use strict';

let usernamePage = document.querySelector('#username-page');
let chatPage = document.querySelector('#chat-page');
let usernameForm = document.querySelector('#usernameForm');
let messageForm = document.querySelector('#messageForm');
let messageInput = document.querySelector('#message');
let messageArea = document.querySelector('#messageArea');
let messageAreaUser = document.querySelector('#messageAreaUser');
let connectingElement = document.querySelector('.connecting');
let chatRoomId = document.querySelector('#chatRoomId').value;


let stompClient = null;
let username = null;

const colors = [
	'#2196F3', '#32c787', '#00BCD4', '#ff5652',
	'#ffc107', '#ff85af', '#FF9800', '#39bbb0'
];



function connect(event) {

	username = document.querySelector('#name').value.trim();
	alert(username);
	if (username) {
		

		let socket = new SockJS('/javatechie');
		stompClient = Stomp.over(socket);

		stompClient.connect({}, onConnected, onError);
	}
	event.preventDefault();
}


function onConnected() {
	// Subscribe to the Public Topic
	stompClient.subscribe('/topic/public/' + chatRoomId + '/', onMessageReceived);
	//stompClient.subscribe('/topic/public/', onMessageReceived);
	stompClient.subscr
	console.log(chatRoomId + "11");
	// Tell your username to the server
	stompClient.send('/app/chat.send.' + chatRoomId,
		{},
		JSON.stringify({ chatRoomId: chatRoomId, sender: username, type: 'JOIN' })
		//chatRoomId connection 필요

	)

 
}


function onError(error) {
	connectingElement.textContent = 'Could not connect to WebSocket server. Please refresh this page to try again!';
	connectingElement.style.color = 'red';
}


function send(event) {
	let messageContent = messageInput.value.trim();

	if (messageContent && stompClient) {
		let chatMessage = {
			sender: username,
			content: messageInput.value,
			chatRoomId,
			updataAt: '',
			type: 'CHAT'
		};

		stompClient.send('/app/chat.send' + '.' + chatRoomId, {}, JSON.stringify(chatMessage));
		messageInput.value = '';
	}
	event.preventDefault();
}


function onMessageReceived(payload) {
	let message = JSON.parse(payload.body);

	let messageElement = document.createElement('li');

	if (message.type === 'JOIN') {
		messageElement.classList.add('event-message');
		message.content = message.sender + ' joined!';
	} else if (message.type === 'LEAVE') {
		messageElement.classList.add('event-message');
		message.content = message.sender + ' left!';
	} else {
		console.log('chat-message');
		messageElement.classList.add('chat-message');
		let usernameElement = document.createElement('span');
		let usernameText = document.createTextNode(message.sender);
		usernameElement.appendChild(usernameText);
		messageElement.appendChild(usernameElement);
	}

	let textElement = document.createElement('p');
	let messageText = document.createTextNode(message.content);
	textElement.appendChild(messageText);
	messageElement.appendChild(textElement);
	if (message.sender == 'kwon') {
		messageElement.className = 'messaging__main-chat__bubble';
	}
	else {
		messageElement.className = 'messaging__main-chat__bubble user';
	}
	messageArea.appendChild(messageElement);
	messageArea.scrollTop = messageArea.scrollIntoView(false);

}


function getAvatarColor(messageSender) {
	let hash = 0;
	for (let i = 0; i < messageSender.length; i++) {
		hash = 31 * hash + messageSender.charCodeAt(i);
	}

	let index = Math.abs(hash % colors.length);
	return colors[index];
}

window.onload = () => {
	alert("onload work on"); document.querySelector('#userFormAutoClick').click();


}


usernameForm.addEventListener('submit', connect, true)
messageForm.addEventListener('submit', send, true)