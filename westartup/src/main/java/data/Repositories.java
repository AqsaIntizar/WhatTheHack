package data;

import data.loginrepository.HCLoginRepository;
import data.loginrepository.LoginRepository;
import data.startuprepository.HCStartupRepository;
import data.startuprepository.StartupRepository;
import data.userrepository.HCUserRepository;
import data.userrepository.UserRepository;

public class Repositories {
        private static Repositories instance = new Repositories();

        public static Repositories getInstance() {
            return instance;
        }

        private Repositories() {
        }

        public LoginRepository getLoginRepository()
        {
            return new HCLoginRepository();
        }
        public StartupRepository getStartupRepository() { return new HCStartupRepository(); }
        public UserRepository getUserRepository() { return new HCUserRepository(); }
}
