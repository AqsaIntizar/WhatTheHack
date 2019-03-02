package server;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.pmw.tinylog.Logger;

import javax.websocket.Session;
import java.io.IOException;
import java.util.Map;
import java.util.logging.Level;

public class SocketHelper {
    private static ObjectMapper objectMapper = new ObjectMapper();

    public static void send(Session session, Map<String, Object> data) {
        String json = "<ERROR>";

        try {
            json = objectMapper.writeValueAsString(data);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        SocketHelper.send(session, json);
    }

    public static void send(Session session, String message) {
        try {
            session.getBasicRemote().sendText(message);
        } catch (IOException ex) {
            Logger.warn("Exception during send", ex);
        }
    }
}
