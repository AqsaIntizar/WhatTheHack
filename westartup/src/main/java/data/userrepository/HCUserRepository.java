package data.userrepository;

import data.startuprepository.HCStartupRepository;
import domain.User;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class HCUserRepository implements UserRepository {
    private List<User> users;

    public HCUserRepository() {
        users = new ArrayList<>();
        users.add(new User(0, "John", "Doe", "john@doe.gmail.com", null, "john_doe.png", null, null, "Neverland"));
    }

    @Override
    public void addUser(User user) {
        users.add(user);
    }

    @Override
    public List<User> getUsers() {
        return new ArrayList<>(users);
    }

    @Override
    public User getUser(int id) {
        for (User user : users) {
            if(user.getId() == id) {
                return user;
            }
        }

        return null;
    }

    @Override
    public void deleteUser(int id) {
        for (User user : users) {
            if(user.getId() == id) {
                users.remove(user);
                return;
            }
        }
    }
}
