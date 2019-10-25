package com.qf.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    private Integer cid;
    private Integer uid;
    private Integer g_id;
    private Integer number;
    private double zongjia;
    private double zongjia_num;
    private Integer numeber_num;
    private List<ShowGoods> showGoods;
    private List<User> users;



}
