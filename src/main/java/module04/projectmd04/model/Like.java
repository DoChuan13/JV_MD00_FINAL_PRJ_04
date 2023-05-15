package module04.projectmd04.model;

import java.io.Serializable;
import java.util.Date;

public class Like implements Serializable {
    private int likeId;
    private final Date likeTime = new Date();

    private User likedUser;

    public Date getLikeTime() {
        return likeTime;
    }

    public Like() {
    }

    public Like(int likeId, User likedUser) {
        this.likeId = likeId;
        this.likedUser = likedUser;
    }

    public int getLikeId() {
        return likeId;
    }

    public void setLikeId(int likeId) {
        this.likeId = likeId;
    }

    public User getLikedUser() {
        return likedUser;
    }

    public void setLikedUser(User likedUser) {
        this.likedUser = likedUser;
    }

    @Override
    public String toString() {
        return "Like{" + "likeId=" + likeId + ", user=" + likedUser + '}';
    }
}
