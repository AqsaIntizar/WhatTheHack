package domain;

import java.sql.Date;
import java.util.Objects;

public class Startup {
    private int startupId;
    private User owner;
    private String imgUrl;
    private String about;
    private String website;
    private String name;
    private Date creationDate;
    private String city;

    public Startup(int startupId, User owner, String imgUrl, String about, String website, String name, Date creationDate, String city) {
        this.startupId = startupId;
        this.owner = owner;
        this.imgUrl = imgUrl;
        this.about = about;
        this.website = website;
        this.name = name;
        this.creationDate = creationDate;
        this.city = city;
    }

    public Startup(int startupId, String imgUrl, User owner, String name) {
        this(startupId, owner, imgUrl, null, null, name, null, null);
    }

    public Startup(int startupId, User owner, String name) {
        this(startupId, "startup-default.jpg", owner, name);
    }

    public int getStartupId() {
        return startupId;
    }

    public User getOwner() {
        return owner;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public String getAbout() {
        return about;
    }

    public String getWebsite() {
        return website;
    }

    public String getName() {
        return name;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public String getCity() {
        return city;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Startup)) return false;
        Startup startup = (Startup) o;
        return getStartupId() == startup.getStartupId();
    }

    @Override
    public int hashCode() {

        return Objects.hash(getStartupId());
    }
}
