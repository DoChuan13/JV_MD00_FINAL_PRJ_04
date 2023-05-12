package module04.projectmd04.service;

public final class Services {
    private static Services instance;

    public Services() {
    }

    public static synchronized Services getInstance() {
        if (instance == null) instance = new Services();
        return instance;
    }
}