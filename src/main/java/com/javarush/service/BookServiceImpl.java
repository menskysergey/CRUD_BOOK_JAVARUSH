package com.javarush.service;

import com.javarush.dao.BookDAO;
import com.javarush.model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookDAO bookDAO;

    @Transactional
    public void addBook(Book book) {
        this.bookDAO.addBook(book);
    }

    @Transactional
    public void updateBook(Book book) {
        this.bookDAO.updateBook(book);
    }

    @Transactional
    public void deleteBook(int id) {
        this.bookDAO.deleteBook(id);
    }

    @Transactional
    public Book getBookById(int id) {
        return this.bookDAO.getBookById(id);
    }

    @Transactional
    public List<Book> listBooks(int rowsPerPage, int page, String criterion) {
        return this.bookDAO.listBooks(rowsPerPage, page, criterion);
    }

    @Transactional
    public long getBooksCount() {
        return this.bookDAO.getBooksCount();
    }
}
