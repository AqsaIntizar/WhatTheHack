package data;

import data.loginrepository.HCLoginRepository;
import data.loginrepository.LoginRepository;
import data.startuprepository.HCStartupRepository;
import data.startuprepository.StartupRepository;
import data.userrepository.HCUserRepository;
import data.userrepository.MySqlUserRepository;
import data.userrepository.UserRepository;

public class Repositories {
    private static Repositories instance = new Repositories();

    public static Repositories getInstance() {
        return instance;
    }

    private Repositories() {
    }

    public UserRepository getUserRepository() { return new MySqlUserRepository(); }
    public LoginRepository getLoginRepository()
    {
        return new HCLoginRepository();
    }
    public StartupRepository getStartupRepository() { return new HCStartupRepository(); }
}
