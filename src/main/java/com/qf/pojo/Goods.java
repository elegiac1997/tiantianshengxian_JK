package com.qf.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Goods {
    private Integer goodsid;
    private String title;
    private String classname;
    private String banner;
    private List<ShowGoods> showGoods;
}
