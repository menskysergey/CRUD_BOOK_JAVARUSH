package com.javarush.controller;

import com.javarush.model.Search;
import com.javarush.model.Book;
import com.javarush.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
public class BookController {
    @Autowired
    private BookService bookService;

    @RequestMapping(value="/")
    public String redirect() {
        return "redirect:/books/1";
    }

    @RequestMapping(value = "books/{page}")
    public String listBooks(@PathVariable("page") int page, Model model) {
        model.addAttribute("book", new Book());
        model.addAttribute("listBooks", bookService.listBooks(10,page,""));
        model.addAttribute("booksCount", bookService.getBooksCount());
        model.addAttribute("page", page);
        model.addAttribute("search", new Search());
        return "books";
    }

    @RequestMapping(value = "books/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book) {
        if(book.getId() == 0) {
            bookService.addBook(book);
            long booksCount = bookService.getBooksCount();
            return "redirect:/books/" + (booksCount/10 + (booksCount%10==0?0:1));
        } else {
            this.bookService.updateBook(book);
            return "redirect:/books/1";
        }
    }

    @RequestMapping("delete/{id}")
    public String deleteBook(@PathVariable("id") int id) {
        bookService.deleteBook(id);
        return "redirect:/books/1";
    }

    @RequestMapping("update/{id}")
    public String editBook(@PathVariable("id") int id, Model model) {
        model.addAttribute("book", bookService.getBookById(id));
        return "books";
    }

    @RequestMapping(value = "books/search", method = RequestMethod.POST)
    public String search(@ModelAttribute(value = "search") Search search, Model model) {
        model.addAttribute("book", new Book());
        model.addAttribute("listBooks", bookService.listBooks(0,1, search.getSearchString()));
        return "books";
    }

    @RequestMapping("bookdata/{id}")
    public String bookData(@PathVariable("id") int id, Model model){
        model.addAttribute("book", this.bookService.getBookById(id));
        return "bookdata";
    }

}
