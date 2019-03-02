package server;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.pmw.tinylog.Logger;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Map;

@ServerEndpoint("/ws")
public class WsEndPoint {

    private final ObjectMapper objectMapper = new ObjectMapper();

    @OnOpen
    public void onOpen(Session session) {

    }

    @OnClose
    public void onClose(Session session) {

    }

    @OnMessage
    public void onMessage(String message, Session session) {
        Logger.info("Received data:\t" + message);

        try {
            final Map<String, Object> data = objectMapper.readValue(
                    message,
                    new TypeReference<Map<String, Object>>() { }
            );

            Logger.warn("Session request received: " + data);

            String action = (String) data.get("action");
            Logger.info("Action:\t" + action);

            switch (action) {
                case "feed":
                    MessageController.feedController(session, data);
                    break;
                default:
                    break;
            }
        } catch (IOException e) {
            Logger.warn("Message was not of allowed JSON format.");
        }
    }

    @OnError
    public void onError(Session session, Throwable t) {

    }
}
