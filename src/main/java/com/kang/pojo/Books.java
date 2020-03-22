package com.kang.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author klr
 * @create 2020-03-21-14:45
 */

//Java中有个类叫Book，为了避免混乱，加个s
//使用Lombok插件
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Books {

    //尽量与数据库字段名一致

    private int bookID;

    private String bookName;

    private int bookCounts;

    private String detail;
}
