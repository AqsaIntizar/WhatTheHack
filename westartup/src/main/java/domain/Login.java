package domain;

import javax.websocket.Session;
import java.util.Objects;

public class Login {
    private Session session;
    private User user;

    public Login(Session session, User user) {
        this.session = session;
        this.user = user;
    }

    public Session getSession() {
        return session;
    }

    public User getUser() {
        return user;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Login)) return false;
        Login login = (Login) o;
        return Objects.equals(getSession(), login.getSession());
    }

    @Override
    public int hashCode() {

        return Objects.hash(getSession());
    }
}
