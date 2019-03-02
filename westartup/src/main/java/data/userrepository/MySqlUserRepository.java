package data.userrepository;

import data.MySqlConnection;
import domain.User;
import org.pmw.tinylog.Logger;
import util.LoginException;
import util.WeStartException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySqlUserRepository implements UserRepository {
    private static final String SQL_ADD_USR = "insert into book(isbn, title) values(?, ?)";
    private static final String SQL_GET_USR = "select * from usr";
    private static final String SQL_GET_USR_BY_ID = "select * from usr where UID = ?";

    @Override
    public void addUser(User user) {

    }

    @Override
    public List<User> getUsers() {
        try (PreparedStatement prep = MySqlConnection.getConnection().prepareStatement(SQL_GET_USR)) {
            try (ResultSet rs = prep.executeQuery()) {
                List<User> users = new ArrayList<>();

                while (rs.next()) {
                    int id = rs.getInt("UID");
                    String lastName = rs.getString("LastName");
                    String name = rs.getString("FirstName");
                    String email = rs.getString("Email");
                    String imgUrl = rs.getString("ImagePath");
                    String cvUrl = rs.getString("CVPath");
                    Date joinDate = rs.getDate("JoinDate");
                    String city = rs.getString("city");
                    String pw = rs.getString("PW");

                    User u = new User(id, name, lastName, email, pw, imgUrl, cvUrl, joinDate, city);
                    users.add(u);
                }

                return users;
            }
        } catch (SQLException ex) {
            throw new WeStartException("Unable to get books from DB.", ex);
        }
    }

    @Override
    public User getUser(int id) {
        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement prep = con.prepareStatement(SQL_GET_USR_BY_ID)) {
            Logger.warn("GETS HERE");
            prep.setInt(1, id);

            try (ResultSet rs = prep.executeQuery()) {
                if (rs.next()) {
                    int UID = rs.getInt("UID");
                    String lastName = rs.getString("LastName");
                    String name = rs.getString("FirstName");
                    String email = rs.getString("Email");
                    String imgUrl = rs.getString("ImagePath");
                    String cvUrl = rs.getString("CVPath");
                    Date joinDate = rs.getDate("JoinDate");
                    String city = rs.getString("city");
                    String pw = rs.getString("PW");
                    return new User(UID, name, lastName, email, pw, imgUrl, cvUrl, joinDate, city);
                } else {
                    return null;
                }
            }
        } catch (SQLException ex) {
            throw new LoginException("Can't find the username.", ex);
        }
    }

    @Override
    public void deleteUser(int id) {

    }
}
