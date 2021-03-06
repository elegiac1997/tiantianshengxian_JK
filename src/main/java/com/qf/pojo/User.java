package com.qf.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private Integer userid;
    private String username;
    private String password;
    private String email;
    private Date creattime;
    private String salt;

}
