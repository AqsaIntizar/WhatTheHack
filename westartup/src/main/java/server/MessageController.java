package server;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import data.Repositories;

import javax.websocket.Session;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

class MessageController {
    static void feedController(Session session, Map<String, Object> data) {
        if("get".equals(data.getOrDefault("method", null))) {

            final Map<String, Object> responseData = new HashMap<>();
            responseData.put("action", "feed");
            responseData.put("method", "post");
            responseData.put("data", Repositories.getInstance().getStartupRepository().getStartups());

            SocketHelper.send(session, responseData);
        }
    }
}
