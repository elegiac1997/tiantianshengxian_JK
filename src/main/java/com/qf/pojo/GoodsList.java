package com.qf.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GoodsList {
    private Integer goodsid;
    private String title;
    private String classname;
    private String banner;
    private Integer id;
    private Integer gid;
    private String gtitle;
    private String imgpath;
    private String bannerpath;
    private String price;
    private Date creattime;
}
