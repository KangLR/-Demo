package com.kang.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kang.pojo.Books;
import com.kang.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * @author klr
 * @create 2020-03-21-18:30
 */
@Controller
@RequestMapping("/book")
public class BookController {
    //调业务层
    // controller调service层
    @Autowired
    @Qualifier("BookServiceImpl")
    private BookService bookService;

    //注解注入通过反射实现，我们可以把set方法去掉，如下
//    public void setBookService(BookService bookService) {
//        this.bookService = bookService;
//    }



    //查询全部的书籍，并且返回到一个书籍展示页面
    @RequestMapping("/allBook")
    public String list(Model model){
        List<Books> books = bookService.queryAllBook();
        model.addAttribute("list",books);
        return "allBook";
    }

    //跳转到增加书籍页面
    @RequestMapping("/toAddBookPage")
    public String toAddPage(){
        return "addBook";
    }

    //添加书籍的请求
    @RequestMapping("/addBook")
    public String addBook(Books books){
        //调业务层方法
        bookService.addBook(books);

        //回到首页，用重定向跳转
        //return "allBook" 也行
        return "redirect:/book/allBook";//重定向实现请求复用
    }

    //跳转到修改书籍页面
    @RequestMapping("/toUpdatePage/{bookID}")
    public String toUpdatePage(@PathVariable int bookID,Model model){
        Books book=bookService.queryBookById(bookID);
        model.addAttribute("book",book);
        return "updateBook";
    }

    //修改书籍
    @RequestMapping("/updateBook")
    public String updateBook(Books books){
        bookService.updateBook(books);
        return "redirect:/book/allBook";
    }

    //删除书籍
    @RequestMapping("/deleteBook/{bookId}")
    public String deleteBook(@PathVariable int bookId){
        bookService.deleteBookById(bookId);
        return "redirect:/book/allBook";
    }


    //根据关键字预查询
    @RequestMapping(value = "/keyword",produces ="application/json;charset=utf-8")
    @ResponseBody
    public Object keywordSerach(String bookName) throws JsonProcessingException {
        System.out.println(bookName);
        List<Books> books = bookService.queryBookByName(bookName);
        //这边血坑,用了@ResponseBody就别加下面的了，不然到了前端用数据完全用不了
//        ObjectMapper mapper=new ObjectMapper();
//        String str=mapper.writeValueAsString(books);
//        System.out.println(str);
        return books;
    }



    //根据输入查询书籍
    @RequestMapping("/queryBook")
    public String queryBook( String queryBookName,Model model){
        List<Books> books=bookService.queryBookByName(queryBookName);
        model.addAttribute("list",books);
        if(!queryBookName.isEmpty()) {
            return "allBook";
        }
        else {
            return "redirect:/book/allBook";
        }
    }
}
