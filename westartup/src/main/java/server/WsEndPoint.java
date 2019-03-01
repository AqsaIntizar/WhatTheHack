package server;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/ws")
public class WsEndPoint {

    @OnOpen
    public void onOpen(Session session) {

    }

    @OnClose
    public void onClose(Session session) {

    }

    @OnMessage
    public void onMessage(String message, Session session) {

    }

    @OnError
    public void onError(Session session, Throwable t) {

    }
}
