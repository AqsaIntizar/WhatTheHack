package data.loginrepository;

import domain.Login;

import javax.websocket.Session;
import java.util.List;

public interface LoginRepository {
    void addLogin(Login login);
    List<Login> getLogins();
    Login getLogin(Session session);
    void deleteLogin(Session session);
}
