package data;

import org.pmw.tinylog.Logger;
import util.WeStartException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/westartup";
    private static final String UID = "westartup_user";
    private static final String PWD = "westartup_user";

    public static Connection getConnection() {
        try {
            return DriverManager.getConnection(URL, UID, PWD);
        } catch (SQLException ex) {
            Logger.warn("Exception!", ex);
            throw new WeStartException("Cannot connect to DB.", ex);
        }
    }

}
