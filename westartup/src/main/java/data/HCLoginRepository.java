package data;

import domain.Login;

import javax.websocket.Session;
import java.util.ArrayList;
import java.util.List;

public class HCLoginRepository implements LoginRepository {
    private List<Login> logins;

    HCLoginRepository() {
        this.logins = new ArrayList<>();
    }

    @Override
    public void addLogin(Login login) {
        logins.add(login);
    }

    @Override
    public List<Login> getLogins() {
        return new ArrayList<>(logins);
    }

    @Override
    public Login getLogin(Session session) {
        for(Login login : logins) {
            if(login.getSession().equals(session)) {
                return login;
            }
        }

        return null;
    }

    @Override
    public void deleteLogin(Session session) {
        for(Login login : logins) {
            if(login.getSession().equals(session)) {
                logins.remove(login);
                return;
            }
        }
    }
}
