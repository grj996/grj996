package com.memberdb.entity;

public class User {
    private Long id;
    private String username;
    private String password;
    private String image;
    private Integer type;
    private Integer status;

    public User() {
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(String username, String password, String image, Integer type, Integer status) {
        this.username = username;
        this.password = password;
        this.image = image;
        this.type = type;
        this.status = status;
    }

    public User(Long id, String username, String password, String image, Integer type, Integer status) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.image = image;
        this.type = type;
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", image='" + image + '\'' +
                ", type=" + type +
                ", status=" + status +
                '}';
    }
}
