package data.startuprepository;

import domain.Startup;

import java.util.List;

public interface StartupRepository {
    void addStartup(Startup startup);
    List<Startup> getStartups();
    Startup getStartup(int id);
    void deleteStartup(int id);
}
