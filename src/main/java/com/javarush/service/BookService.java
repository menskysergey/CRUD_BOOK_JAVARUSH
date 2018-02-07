package com.javarush.service;

import com.javarush.model.Book;

import java.util.List;


public interface BookService {

   void addBook (Book book);
   void updateBook(Book book);
   void deleteBook(int id);
   Book getBookById(int id);

   List<Book> listBooks(int rowsPerPage, int page, String criterion);

   long getBooksCount();
}
