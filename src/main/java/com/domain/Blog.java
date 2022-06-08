package com.domain;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Blog {
    private Integer id;
    private String title;
    private String content;
    private String create_time;
    private Integer type_id;
    private Integer admin_id;
    private Date date;
    private Admin admin;
    private List<BlogTag> blogTagList;
    private BlogType blogType;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setCreate_time(Date create_time) {
        String s = null;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            s = simpleDateFormat.format(create_time);
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.create_time = s;
    }

    public Integer getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(Integer admin_id) {
        this.admin_id = admin_id;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public Integer getType_id() {
        return type_id;
    }

    public void setType_id(Integer type_id) {
        this.type_id = type_id;
    }

    public List<BlogTag> getBlogTagList() {
        return blogTagList;
    }

    public void setBlogTagList(List<BlogTag> blogTagList) {
        this.blogTagList = blogTagList;
    }

    public BlogType getBlogType() {
        return blogType;
    }

    public void setBlogType(BlogType blogType) {
        this.blogType = blogType;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCreate_time() {

        return create_time;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", create_time=" + create_time +
                ", type_id=" + type_id +
                ", admin_id=" + admin_id +
                ", date=" + date +
                ", admin=" + admin +
                ", blogTagList=" + blogTagList +
                ", blogType=" + blogType +
                '}';
    }
}
