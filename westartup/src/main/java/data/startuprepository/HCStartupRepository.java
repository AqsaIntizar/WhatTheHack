package data.startuprepository;

import data.Repositories;
import domain.Startup;

import java.util.ArrayList;
import java.util.List;

public class HCStartupRepository implements StartupRepository {
    private List<Startup> startups;

    public HCStartupRepository() {
        startups = new ArrayList<>();
        startups.add(new Startup(0, Repositories.getInstance().getUserRepository().getUser(0), "PHP Project"));
        startups.add(new Startup(1, Repositories.getInstance().getUserRepository().getUser(0), "JAVA Project"));
        startups.add(new Startup(2, Repositories.getInstance().getUserRepository().getUser(0), "DESIGN Project"));
    }

    @Override
    public void addStartup(Startup startup) {
        startups.add(startup);
    }

    @Override
    public List<Startup> getStartups() {
        return new ArrayList<>(startups);
    }

    @Override
    public Startup getStartup(int id) {
        for (Startup startup : startups) {
            if(startup.getStartupId() == id) {
                return startup;
            }
        }

        return null;
    }

    @Override
    public void deleteStartup(int id) {
        for (Startup startup : startups) {
            if(startup.getStartupId() == id) {
                startups.remove(startup);
                return;
            }
        }
    }
}
