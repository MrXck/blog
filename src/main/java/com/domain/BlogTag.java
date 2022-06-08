package com.domain;

import java.util.List;

public class BlogTag {
    private Integer id;
    private String tag_name;
    private List<Blog> blogList;

    public List<Blog> getBlogList() {
        return blogList;
    }

    public void setBlogList(List<Blog> blogList) {
        this.blogList = blogList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTag_name() {
        return tag_name;
    }

    public void setTag_name(String tag_name) {
        this.tag_name = tag_name;
    }

    @Override
    public String toString() {
        return "BlogTag{" +
                "id=" + id +
                ", tag_name='" + tag_name + '\'' +
                ", blogList=" + blogList +
                '}';
    }

}
