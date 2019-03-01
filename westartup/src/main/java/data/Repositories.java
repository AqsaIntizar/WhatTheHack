package data;

public class Repositories {
        private static Repositories instance = new Repositories();

        public static Repositories getInstance() {
            return instance;
        }

        private Repositories() {
        }

        public LoginRepository getBookRepository()
        {
            return new HCLoginRepository();
        }
}
