package data.userrepository;

import domain.User;

import java.util.List;

public interface UserRepository {
    void addUser(User user);
    List<User> getUsers();
    User getUser(int id);
    void deleteUser(int id);
}
