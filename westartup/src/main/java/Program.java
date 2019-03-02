import data.Repositories;
import domain.User;

import java.util.List;

public class Program {
    public static void main(String[] args) {
        new Program().run();
    }

    private void run() {
        List<User> users = Repositories.getInstance().getUserRepository().getUsers();

        System.out.println(users);
        System.out.println(Repositories.getInstance().getUserRepository().getUser(1).getName());
    }
}
