<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Spring Boot WebSocket Chat Application</title>
<link rel="stylesheet" href="/css/main.css" />
</head>
<body>
    <noscript>
        <h2>Sorry! Your browser doesn't support Javascript</h2>
    </noscript>

    <!-- �i�J���� -->
    <div id="username-page">
        <div class="username-page-container">
            <h1 class="title">�T�{�W�٫�i�J��ѫ�</h1>
            
            <form id="usernameForm" name="usernameForm">
                <div class="form-group popup">
                    <input type="text" id="name" value="${member.email}${company.name}${admin}" disabled 
                        autocomplete="off" class="form-control popup" />
                    <span class="popuptext" id="hint">�п�J�W��</span>
                </div>
                <div class="form-group">
                    <button type="submit" class="accent username-submit">�}�l���</button>
                </div>
            </form>
        </div>
    </div>

    <!-- ��ѫǭ��� -->
    <div id="chat-page" class="hidden">
        <div class="chat-container">
            <div class="chat-header">
                <h2></h2>
            </div>
            <div class="connecting">Connecting...</div>
            <ul id="messageArea">

            </ul>
            <form id="messageForm" name="messageForm">
                <div class="form-group">
                    <div class="input-group clearfix">
                        <input type="text" id="message" placeholder="��J�T��..."
                            autocomplete="off" class="form-control" />
                        <button type="submit" class="primary">�e�X</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script type="text/javascript" charset="UTF-8" src="/js/main.js?version=1"></script>
</body>
</html>